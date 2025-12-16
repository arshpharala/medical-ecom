<?php

namespace App\Http\Controllers\Admin\Inventory;

use Illuminate\Http\Request;
use App\Models\Inventory\Supplier;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreSupplierRequest;
use App\Http\Requests\UpdateSupplierRequest;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Validator;

class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $brands = Supplier::withTrashed()->withCount('products');
            return DataTables::of($brands)
                ->addColumn('action', function ($row) {
                    $editUrl = route('admin.inventory.suppliers.edit', $row->id);
                    $deleteUrl = route('admin.inventory.suppliers.destroy', $row->id);
                    $restoreUrl = route('admin.inventory.suppliers.restore', $row->id);
                    $editSidebar = true;
                    return view('theme.adminlte.components._table-actions', compact('editUrl', 'deleteUrl', 'restoreUrl', 'row', 'editSidebar'))->render();
                })
                ->editColumn('created_at', function ($row) {
                    return $row->created_at?->format('d-M-Y  h:m A');
                })
                ->addColumn('is_active', fn($row) => $row->deleted_at ? '<span class="badge badge-danger">Deleted</span>' : '<span class="badge badge-success">Active</span>')
                ->rawColumns(['logo', 'action', 'is_active'])
                ->make(true);
        }
        return view('theme.adminlte.inventories.suppliers.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $response['view'] =  view('theme.adminlte.inventories.suppliers.create')->render();

        return response()->json([
            'success' => true,
            'data' => $response
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreSupplierRequest $request)
    {
        $data = $request->validated();

        Supplier::create($data);

        return response()->json([
            'message'   => __('crud.created', ['name' => 'Supplier']),
            'redirect'  => route('admin.inventory.suppliers.index')
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $supplier = Supplier::findOrFail($id);

        $data['supplier'] = $supplier;

        $response['view'] =  view('theme.adminlte.inventories.suppliers.edit', $data)->render();

        return response()->json([
            'success'   => true,
            'data'      => $response
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateSupplierRequest $request, string $id)
    {
        $supplier = Supplier::findOrFail($id);

        $data = $request->validated();


        $supplier->update($data);

        return response()->json([
            'message'   => __('crud.updated', ['name' => 'Supplier']),
            'redirect'  => route('admin.inventory.suppliers.index')
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $supplier = Supplier::findOrFail($id);
        $supplier->delete();

        return response()->json([
            'message'   => __('crud.deleted', ['name' => 'Supplier']),
            'redirect'  => route('admin.inventory.suppliers.index')
        ]);
    }

    /**
     * Restore the specified resource from storage.
     */
    public function restore(string $id)
    {
        $supplier = Supplier::withTrashed()->findOrFail($id);
        $supplier->restore();

        return response()->json([
            'message'   => __('crud.restored', ['name' => 'Supplier']),
            'redirect'  => route('admin.inventory.suppliers.index')
        ]);
    }
}
