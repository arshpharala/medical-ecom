// ===============================
// Global State
// ===============================
let activeAttributeKeys = [];
let currencySymbol = $("meta[name='currency-symbol']").attr("content") || "GBP";
let ajaxRequest = null; // prevent race conditions

// ===============================
// Price Slider Initialization
// ===============================
function initPriceSlider(
    sliderId,
    labelMinId,
    labelMaxId,
    startMin = 5,
    startMax = 2000,
    onChange = null
) {
    const slider = document.getElementById(sliderId);
    if (!slider) return;

    const $labelMin = $("#" + labelMinId);
    const $labelMax = $("#" + labelMaxId);

    if (slider.noUiSlider) slider.noUiSlider.destroy();

    noUiSlider.create(slider, {
        start: [startMin, startMax],
        connect: true,
        range: { min: 0, max: 10000 },
        step: 1,
        format: {
            to: (value) => Math.round(value),
            from: (value) => Number(value),
        },
    });

    slider.noUiSlider.on("update", (values) => {
        $labelMin.text(`${currencySymbol} ${values[0]}`);
        $labelMax.text(`${currencySymbol} ${values[1]}`);
    });

    if (onChange) {
        slider.noUiSlider.on("change", onChange);
    }
}

// ===============================
// DOM Ready
// ===============================
$(function () {
    // Init sidebar price slider
    initPriceSlider(
        "price-slider-sidebar",
        "priceLabelMinSidebar",
        "priceLabelMaxSidebar",
        5,
        2000,
        () => fetchProducts(1)
    );

    // ===============================
    // Update URL (clean + safe)
    // ===============================
    function updateURL(filters, page = 1) {
        const params = new URLSearchParams();

        Object.keys(filters).forEach((key) => {
            if (key.startsWith("attr_") && !activeAttributeKeys.includes(key))
                return;

            const value = filters[key];
            if (Array.isArray(value)) {
                value.forEach((v) => params.append(`${key}[]`, v));
            } else if (value !== "" && value !== null && value !== undefined) {
                params.set(key, value);
            }
        });

        params.set("page", page);
        history.pushState(null, "", "?" + params.toString());
    }

    // ===============================
    // Collect Filters
    // ===============================
    function collectFilters() {
        let filters = {};

        const activeCategory = $(".category-row.active").data("category");
        if (activeCategory) filters.category = activeCategory;

        $(".select").each(function () {
            const name = $(this).attr("name") || $(this).data("filter");
            if (name && $(this).val()) {
                filters[name] = $(this).val();
            }
        });

        filters.tags = $(".cc-form-check-input:checked")
            .map(function () {
                return $(this).next("label").text().trim();
            })
            .get();

        filters.search = $(".search-input").val();
        filters.sort_by = $(".sort-select").val();

        return filters;
    }

    // ===============================
    // Fetch Products (AJAX)
    // ===============================
    function fetchProducts(page = 1) {
        const filters = collectFilters();
        updateURL(filters, page);

        if (ajaxRequest) ajaxRequest.abort();

        ajaxRequest = $.ajax({
            url: window.ajaxProductURL,
            method: "GET",
            data: { ...filters, page },
            success(res) {
                if (!res.success) return;

                renderProducts(res.data.products || []);
                render_pagination(res.data.pagination || {});
            },
            complete() {
                ajaxRequest = null;
            },
        });
    }

    // ===============================
    // Render Products
    // ===============================
    function renderProducts(products) {
        const $grid = $("#products").empty();
        const $list = $("#products-list").empty();

        products.forEach((product) => {
            $grid.append(render_product_card(product, true));
            $list.append(render_product_card(product, false));
        });
    }

    // ===============================
    // Dynamic Attribute Filters
    // ===============================
    function renderDynamicAttributeFilters(attributes) {
        const $container = $("#dynamic-attribute-filters").empty();
        const urlParams = new URLSearchParams(window.location.search);

        activeAttributeKeys = [];

        attributes.forEach((attr) => {
            const key = `attr_${attr.id}`;
            activeAttributeKeys.push(key);

            const selectedValue = urlParams.get(key) || "";

            const $wrapper = $(
                `<div class="mb-4"><h5 class="fs-3 mb-3">${attr.name}</h5></div>`
            );
            const $select = $(
                `<select class="form-select theme-select" name="${key}">
                    <option value="">Select ${attr.name}</option>
                </select>`
            );

            $.each(attr.values, function (id, val) {
                $select.append(
                    `<option value="${id}" ${
                        id == selectedValue ? "selected" : ""
                    }>${val}</option>`
                );
            });

            $wrapper.append($select);
            $container.append($wrapper);
        });
    }

    function loadInitialAttributeFilters(categoryId) {
        if (!categoryId) return;

        $.get(`/ajax/category/${categoryId}/attributes`, function (res) {
            if (res.success) {
                renderDynamicAttributeFilters(res.attributes);
            }
        });
    }

    // ===============================
    // Category Click (AJAX)
    // ===============================
    $(document).on("click", ".parent-category, .child-category", function (e) {
        e.preventDefault();

        const $row = $(this);

        // 1. Toggle expand ONLY for parent
        if ($row.hasClass("parent-category")) {
            $row.toggleClass("is-open");
        }

        // 2. Active state
        $(".category-row").removeClass("active");
        $row.addClass("active");

        const categoryId = $row.data("category");
        if (!categoryId) return;

        // 3. Load attributes
        loadInitialAttributeFilters(categoryId);

        // 4. Reset price slider
        initPriceSlider(
            "price-slider-sidebar",
            "priceLabelMinSidebar",
            "priceLabelMaxSidebar",
            5,
            2000,
            () => fetchProducts(1)
        );

        // 5. Fetch products
        fetchProducts(1);
    });

    $(".child-category.active").each(function () {
        const $parent = $(this)
            .closest(".sub-category-group")
            .prev(".parent-category");
        $parent.addClass("is-open has-active-child");
    });

    // ===============================
    // Search
    // ===============================
    let searchTimer;
    $(".search-input").on("keyup", function () {
        clearTimeout(searchTimer);
        searchTimer = setTimeout(() => fetchProducts(1), 400);
    });

    // ===============================
    // Filters Change
    // ===============================
    $(document).on("change", "select", () => fetchProducts(1));
    $(document).on("change", "#dynamic-attribute-filters select", () =>
        fetchProducts(1)
    );

    // ===============================
    // Pagination
    // ===============================
    $(document).on("click", ".pagination .page-link", function (e) {
        e.preventDefault();
        const page = $(this).data("page");
        if (page) fetchProducts(page);
    });

    // ===============================
    // Initial Load
    // ===============================
    const initialPage =
        parseInt(new URLSearchParams(window.location.search).get("page")) || 1;
    fetchProducts(initialPage);

    if (window.activeCategoryId) {
        $(`.category-row[data-category="${window.activeCategoryId}"]`).addClass(
            "active"
        );
        loadInitialAttributeFilters(window.activeCategoryId);
    }
});
