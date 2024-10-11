<?php

namespace App\Http\Controllers\Admin;

/**
 * Users Controller
 *
 * @package TokenLite
 * @author Softnio
 * @version 1.1.3
 */

use Validator;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Whitelist;

class WhitelistController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     * @version 1.1
     * @since 1.0
     * @return void
     */
    public function index(Request $request)
    {
        $per_page   = gmvl('whitelist_per_page', 10);
        $order_by   = gmvl('whitelist_order_by', 'updated_at');
        $ordered    = gmvl('whitelist_ordered', 'DESC');

        $whitelist = Whitelist::orderBy($order_by, $ordered)->paginate($per_page);
        
        $pagi = $whitelist->appends(request()->all());
        return view('admin.whitelist', compact('whitelist', 'pagi'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     * @version 1.0.2
     * @since 1.0
     * @return void
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'address' => 'required'
        ]);

        if ($validator->fails()) {
            $msg = '';
            if ($validator->errors()->has('address')) {
                $msg = $validator->errors()->first();
            } else {
                $msg = __('messages.somthing_wrong');
            }

            $ret['msg'] = 'warning';
            $ret['message'] = $msg;
            return response()->json($ret);
        } else {
                $whitelist = Whitelist::create([
                    'address' => $request->input('address')
                ]);

                if ($whitelist) {
                    $whitelist->save();

                    $ret['link'] = route('admin.whitelist');
                    $ret['msg'] = 'success';
                    $ret['message'] = __('messages.insert.success', ['what' => 'Whitelist']);
                } else {
                    $ret['msg'] = 'warning';
                    $ret['message'] = __('messages.insert.warning', ['what' => 'Whitelist']);
                }

            if ($request->ajax()) {
                return response()->json($ret);
            }
            return back()->with([$ret['msg'] => $ret['message']]);
        }
    }

    /**
     * Delete address
     *
     * @return \Illuminate\Http\Response
     * @version 1.0.0
     * @since 1.0
     */
    public function delete(Request $request)
    {
        $ret['msg'] = 'info';
        $ret['message'] = __('messages.nothing');

        $whitelist = Whitelist::where(['id' => $request->input('id')])->get();
        if ($whitelist->count()) {
            $data = $whitelist->each(function ($item) {
                $item->delete();
            });

            if ($data) {
                $ret['msg'] = 'success';
                $ret['message'] = __('messages.delete.delete', ['what' => 'Whitelist']);
            } else {
                $ret['msg'] = 'warning';
                $ret['message'] = __('messages.delete.delete_failed', ['what' => 'Whitelist']);
            }
        } else {
            $ret['msg'] = 'success';
            $ret['alt'] = 'no';
            $ret['message'] = __('There has not any unvarified users!');
        }


        if ($request->ajax()) {
            return response()->json($ret);
        }
        return back()->with([$ret['msg'] => $ret['message']]);
    }
}
