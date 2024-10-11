@extends('layouts.admin')
@section('title', 'Whitelist')
@section('content')

<div class="page-content">
    <div class="container">
        @include('layouts.messages')
        @include('vendor.notice')
        <div class="card content-area content-area-mh">
            <div class="card-innr">
                <div class="card-head has-aside">
                    <h4 class="card-title">Whitelist</h4>
                    <div class="relative d-inline-block d-md-none">
                        <a href="#" class="btn btn-light-alt btn-xs btn-icon toggle-tigger"><em class="ti ti-more-alt"></em></a>
                        <div class="toggle-class dropdown-content dropdown-content-center-left pd-2x">
                            <div class="card-opt data-action-list">
                                <ul class="btn-grp btn-grp-block guttar-20px guttar-vr-10px">
                                    <li>
                                        <a href="#" class="btn btn-auto btn-sm btn-primary" data-toggle="modal" data-target="#addAddress">
                                            <em class="fas fa-plus-circle"> </em>
                                            <span>Add <span class="d-none d-md-inline-block">Address</span></span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card-opt data-action-list d-none d-md-inline-flex">
                        <ul class="btn-grp btn-grp-block guttar-20px">
                            <li>
                                <a href="#" class="btn btn-auto btn-sm btn-primary" data-toggle="modal" data-target="#addAddress">
                                    <em class="fas fa-plus-circle"> </em><span>Add <span class="d-none d-md-inline-block">Address</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="page-nav-wrap">
                    <div class="page-nav-bar justify-content-between bg-lighter">
                        <div class="page-nav w-100 w-lg-auto">
                            <ul class="nav">
                                <li class="nav-item active"><a class="nav-link" href="{{ route('admin.whitelist') }}">All</a></li>
                            </ul>
                        </div>
                        <div class="search flex-grow-1 pl-lg-4 w-100 w-sm-auto">
                            <form action="{{ route('admin.whitelist') }}" method="GET" autocomplete="off">
                                <div class="input-wrap">
                                    <span class="input-icon input-icon-left"><em class="ti ti-search"></em></span>
                                    <input type="search" class="input-solid input-transparent" placeholder="Quick search with wallet address" value="{{ request()->get('s', '') }}" name="s">
                                </div>
                            </form>
                        </div>
                        @if(!empty(env_file()) && nio_status() && !empty(app_key()))
                        <div class="tools w-100 w-sm-auto">
                            <ul class="btn-grp guttar-8px">
                                <li><a href="#" class="btn btn-light btn-sm btn-icon btn-outline bg-white advsearch-opt"> <em class="ti ti-panel"></em> </a></li>
                                <li>
                                    <div class="relative">
                                        <a href="#" class="btn btn-light bg-white btn-sm btn-icon toggle-tigger btn-outline"><em class="ti ti-server"></em> </a>
                                        <div class="toggle-class dropdown-content dropdown-content-sm dropdown-content-center shadow-soft">
                                            <ul class="dropdown-list">
                                                <li><h6 class="dropdown-title">Export</h6></li>
                                                <li><a href="{{ route('admin.export', array_merge([ 'table' => 'whitelist', 'format' => 'entire'], request()->all())) }}">Entire</a></li>
                                                <li><a href="{{ route('admin.export',array_merge([ 'table' => 'whitelist', 'format' => 'minimal'], request()->all())) }}">Minimal</a></li>
                                                <li><a href="{{ route('admin.export',array_merge([ 'table' => 'whitelist', 'format' => 'compact'], request()->all())) }}">Compact</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="relative">
                                        <a href="#" class="btn btn-light bg-white btn-sm btn-icon toggle-tigger btn-outline"><em class="ti ti-settings"></em> </a>
                                        <div class="toggle-class dropdown-content dropdown-content-sm dropdown-content-center shadow-soft">
                                            <form class="update-meta" action="#" data-type="user_page_meta">
                                                <ul class="dropdown-list">
                                                    <li><h6 class="dropdown-title">Show</h6></li>
                                                    <li{!! (gmvl('whitelist_per_page', 10)==10) ? ' class="active"' : '' !!}>
                                                        <a href="#" data-meta="perpage=10">10</a></li>
                                                    <li{!! (gmvl('whitelist_per_page', 10)==20) ? ' class="active"' : '' !!}>
                                                        <a href="#" data-meta="perpage=20">20</a></li>
                                                    <li{!! (gmvl('whitelist_per_page', 10)==50) ? ' class="active"' : '' !!}>
                                                        <a href="#" data-meta="perpage=50">50</a></li>
                                                </ul>
                                                <ul class="dropdown-list">
                                                    <li><h6 class="dropdown-title">Order By</h6></li>
                                                    <li{!! (gmvl('whitelist_order_by', 'id')=='id') ? ' class="active"' : '' !!}>
                                                        <a href="#" data-meta="orderby=id">User ID</a></li>
                                                    <li{!! (gmvl('whitelist_order_by', 'id')=='name') ? ' class="active"' : '' !!}>
                                                        <a href="#" data-meta="orderby=name">Name</a></li>
                                                    <li{!! (gmvl('whitelist_order_by', 'id')=='token') ? ' class="active"' : '' !!}>
                                                        <a href="#" data-meta="orderby=token">Token</a></li>
                                                </ul>
                                                <ul class="dropdown-list">
                                                    <li><h6 class="dropdown-title">Order</h6></li>
                                                    <li{!! (gmvl('whitelist_ordered', 'DESC')=='DESC') ? ' class="active"' : '' !!}>
                                                        <a href="#" data-meta="ordered=DESC">DESC</a></li>
                                                    <li{!! (gmvl('whitelist_ordered', 'DESC')=='ASC') ? ' class="active"' : '' !!}>
                                                        <a href="#" data-meta="ordered=ASC">ASC</a></li>
                                                </ul>
                                            </form>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        @endif
                    </div>
                    @if(!empty(env_file()) && nio_status() && !empty(app_key()))
                    <div class="search-adv-wrap hide">
                        <form class="adv-search" id="adv-search" action="{{ route('admin.whitelist') }}" method="GET" autocomplete="off">
                            <div class="adv-search">
                                <div class="row align-items-end guttar-20px guttar-vr-15px">
                                    <div class="col-lg-6">
                                       <div class="input-grp-wrap">
                                            <span class="input-item-label input-item-label-s2 text-exlight">Advanced Search</span>
                                            <div class="input-grp align-items-center bg-white">
                                                <div class="input-wrap flex-grow-1">
                                                    <input value="{{ request()->get('search') }}" class="input-solid input-solid-sm input-transparent" type="text" placeholder="Search by user" name="search">
                                                </div>
                                                <ul class="search-type">
                                                    <li class="input-wrap input-radio-wrap">
                                                        <input name="by" value="" class="input-radio-select" id="advs-by-name" type="radio" id="advs-by-name"{{ (empty(request()->by) || (request()->by!='email' && request()->by!='id')) ? ' checked' : '' }}>
                                                        <label for="advs-by-name">Name</label>
                                                    </li>
                                                    <li class="input-wrap input-radio-wrap">
                                                        <input name="by" value="email" class="input-radio-select" id="advs-by-email" type="radio" id="advs-by-email"{{ (isset(request()->by) && request()->by=='email') ? ' checked' : '' }}>
                                                        <label for="advs-by-email">Email</label>
                                                    </li>
                                                    <li class="input-wrap input-radio-wrap">
                                                        <input name="by" value="id" class="input-radio-select" id="advs-by-id" type="radio" id="advs-by-id"{{ (isset(request()->by) && request()->by=='id') ? ' checked' : '' }}>
                                                        <label for="advs-by-id">ID</label>
                                                    </li>
                                                    <li class="input-wrap input-radio-wrap">
                                                        <input name="by" value="walletAddress" class="input-radio-select" id="advs-by-walletAddress" type="radio" id="advs-by-walletAddress"{{ (isset(request()->by) && request()->by=='walletAddress') ? ' checked' : '' }}>
                                                        <label for="advs-by-walletAddress">Wallet</label>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-sm-4 col-mb-6">
                                        <div class="input-wrap input-item-middle text-left">
                                            <input {{ request()->get('wallet') == 'yes' ? 'checked' : '' }} name="wallet" value="yes" class="input-checkbox input-checkbox-md" id="has-wallet" type="checkbox">
                                            <label for="has-wallet">Has Wallet</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-sm-8 col-mb-6">
                                        <div class="input-wrap input-item-middle text-left">
                                            <input {{ request()->get('adm') == 'yes' ? 'checked' : '' }} name="adm" value="yes" class="input-checkbox input-checkbox-md" id="include-admin" type="checkbox">
                                            <label for="include-admin">Including Admin</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-lg-2 col-mb-6">
                                        <div class="input-wrap input-with-label">
                                            <label class="input-item-label input-item-label-s2 text-exlight">Account Status</label>
                                            <select name="state" class="select select-sm select-block select-bordered" data-dd-class="search-off">
                                                <option value="">Any Status</option>
                                                <option{{ request()->get('state') == 'active' ? ' selected' : '' }} value="active">Actived</option>
                                                <option{{ request()->get('state') == 'suspend' ? ' selected' : '' }} value="suspend">Suspended</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-lg-2 col-mb-6">
                                        <div class="input-wrap input-with-label">
                                            <label class="input-item-label input-item-label-s2 text-exlight">Reg Method</label>
                                            <select name="reg" class="select select-sm select-block select-bordered" data-dd-class="search-off">
                                                <option value="">Any Method</option>
                                                <option{{ request()->get('reg') == 'internal' ? ' selected' : '' }} value="internal">Internal</option>
                                                <option{{ request()->get('reg') == 'email' ? ' selected' : '' }} value="email">Email</option>
                                                <option{{ request()->get('reg') == 'google' ? ' selected' : '' }} value="google">Google</option>
                                                <option{{ request()->get('reg') == 'facebook' ? ' selected' : '' }} value="facebook">Facebook</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-lg-2 col-mb-6">
                                        <div class="input-wrap input-with-label">
                                            <label class="input-item-label input-item-label-s2 text-exlight">Verified Status</label>
                                            <select name="valid" class="select select-sm select-block select-bordered" data-dd-class="search-off">
                                                <option value="">Anything</option>
                                                <option{{ request()->get('valid') == 'email' ? ' selected' : '' }} value="email">Email Verified</option>
                                                <option{{ request()->get('valid') == 'kyc' ? ' selected' : '' }} value="kyc">KYC Verified</option>
                                                <option{{ request()->get('valid') == 'both' ? ' selected' : '' }} value="both">Both Verified</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-lg-2 col-mb-6">
                                        <div class="input-wrap input-with-label">
                                            <label class="input-item-label input-item-label-s2 text-exlight">Token Balance</label>
                                            <select name="token" class="select select-sm select-block select-bordered" data-dd-class="search-off">
                                                <option value="">Any Amount</option>
                                                <option {{ request()->get('token') == 'has' ? 'selected' : '' }} value="has">Has Token</option>
                                                <option {{ request()->get('token') == 'zero' ? 'selected' : '' }} value="zero">Zero Token</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-lg-2 col-mb-6">
                                        <div class="input-wrap input-with-label">
                                            <label class="input-item-label input-item-label-s2 text-exlight">Is Referred By</label>
                                            <select name="refer" class="select select-sm select-block select-bordered" data-dd-class="search-off">
                                                <option value="">Anything</option>
                                                <option {{ request()->get('refer') == 'yes' ? 'selected' : '' }} value="yes">Yes</option>
                                                <option {{ request()->get('refer') == 'no' ? 'selected' : '' }} value="no">No</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-lg-2 col-mb-6">
                                        <div class="input-wrap">
                                            <input type="hidden" name="filter" value="1">
                                            <button class="btn btn-sm btn-sm-s2 btn-auto btn-primary">
                                                <em class="ti ti-search width-auto"></em><span>Search</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    @endif

                    @if (request()->get('filter') || request()->s)
                    <div class="search-adv-result">
                        <div class="search-info">Found <span class="search-count">{{ $whitelist->total() }}</span> Whitelist{{ (isset(request()->adm) && request()->adm=='yes') ? ' including admin user.' : '.' }}</div>
                        <ul class="search-opt">
                            @if(request()->get('search'))
                                <li><a href="{{ qs_url(qs_filter('search')) }}">Search <span>'{{ request()->get('search') }}'</span>{{ (!empty(request()->by)) ? ' ('.(request()->by=='id' ? strtoupper(request()->by) : ucfirst(request()->by)).')' : ' (Name)' }}</a></li>
                            @endif
                            @if(request()->get('wallet'))
                                <li><a href="{{ qs_url(qs_filter('wallet')) }}">Has <span>Wallet</span></a></li>
                            @endif
                            @if(request()->get('token'))
                                <li><a href="{{ qs_url(qs_filter('token')) }}"><span>{{ ucfirst(request()->get('token')) }}</span> Token</a></li>
                            @endif
                            @if(request()->get('state'))
                                <li><a href="{{ qs_url(qs_filter('state')) }}">Status: <span>{{ ucfirst(request()->get('state')) }}</span></a></li>
                            @endif
                            @if(request()->get('reg'))
                                <li><a href="{{ qs_url(qs_filter('reg')) }}">Reg Method:  <span>{{ ucfirst(request()->get('reg')) }}</span></a></li>
                            @endif
                            @if(request()->get('valid'))
                                <li><a href="{{ qs_url(qs_filter('valid')) }}">Verified: <span>{{ (request()->valid=='kyc' ? strtoupper(request()->valid) : ucfirst(request()->valid)) }}</span></a></li>
                            @endif
                            @if(request()->get('refer'))
                                <li><a href="{{ qs_url(qs_filter('refer')) }}">Referred: <span>{{ ucfirst(request()->get('refer')) }}</span></a></li>
                            @endif
                            <li><a href="{{ route('admin.whitelist') }}" class="link link-underline">Clear All</a></li>
                        </ul>
                    </div>
                    @endif
                </div>

                @if($whitelist->total() > 0) 
                <table class="data-table user-list">
                    <thead>
                        <tr class="data-item data-head">
                            <th class="data-col filter-data dt-address">Wallet Address</th>
                            <th class="data-col data-col-wd-md dt-updated-at">Updated At</th>
                            <th class="data-col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($whitelist as $item)
                        <tr class="data-item">
                            <td class="data-col dt-address">
                                <span class="lead user-address">{{ $item->address }}</span>
                            </td>
                            <td class="data-col data-col-wd-md dt-updated-at">
                                <span class="sub sub-s2 sub-email text-wrap">{{ $item->updated_at }}</span>
                            </td>
                            <td class="data-col text-right">
                                <div class="relative d-inline-block">
                                    <a href="#" class="btn btn-light-alt btn-xs btn-icon toggle-tigger"><em class="ti ti-more-alt"></em></a>
                                    <div class="toggle-class dropdown-content dropdown-content-top-left">
                                        <ul class="dropdown-list more-menu-{{$item->id}}">
                                            <li><a href="{{ route('admin.whitelist.view', $item->id) }}"><em class="far fa-eye"></em> View Details</a></li>
                                            <li><a href="javascript:void(0)" class="delete_whitelist" data-id="{{ $item->id }}"><em class="ti ti-trash"></em> Delete</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        {{-- .data-item --}}
                        @endforeach
                    </tbody>
                </table>
                @else 
                    <div class="bg-light text-center rounded pdt-5x pdb-5x">
                        <p><em class="ti ti-server fs-24"></em><br>No whitelists found!</p>
                        <p><a class="btn btn-primary btn-auto" href="{{ route('admin.whitelist') }}">View All</a></p>
                    </div>
                @endif

                @if ($pagi->hasPages())
                <div class="pagination-bar">
                    <div class="d-flex flex-wrap justify-content-between guttar-vr-20px guttar-20px">
                        <div class="fake-class">
                            <ul class="btn-grp guttar-10px pagination-btn">
                                @if($pagi->previousPageUrl())
                                <li><a href="{{ $pagi->previousPageUrl() }}" class="btn ucap btn-auto btn-sm btn-light-alt">Prev</a></li>
                                @endif 
                                @if($pagi->nextPageUrl())
                                <li><a href="{{ $pagi->nextPageUrl() }}" class="btn ucap btn-auto btn-sm btn-light-alt">Next</a></li>
                                @endif
                            </ul>
                        </div>
                        <div class="fake-class">
                            <div class="pagination-info guttar-10px justify-content-sm-end justify-content-mb-end">
                                <div class="pagination-info-text ucap">Page </div>
                                <div class="input-wrap w-80px">
                                    <select class="select select-xs select-bordered goto-page" data-dd-class="search-{{ ($pagi->lastPage() > 7) ? 'on' : 'off' }}">
                                        @for ($i = 1; $i <= $pagi->lastPage(); $i++)
                                        <option value="{{ $pagi->url($i) }}"{{ ($pagi->currentPage() ==$i) ? ' selected' : '' }}>{{ $i }}</option>
                                        @endfor
                                    </select>
                                </div>
                            <div class="pagination-info-text ucap">of {{ $pagi->lastPage() }}</div>
                            </div>
                        </div>
                    </div>
                </div>
                @endif
            </div>
            {{-- .card-innr --}}
        </div>{{-- .card --}}
    </div>{{-- .container --}}
</div>{{-- .page-content --}}

@endsection

@section('modals')

<div class="modal fade" id="addAddress" tabindex="-1">
    <div class="modal-dialog modal-dialog-md modal-dialog-centered">
        <div class="modal-content">
            <a href="#" class="modal-close" data-dismiss="modal" aria-label="Close"><em class="ti ti-close"></em></a>
            <div class="popup-body popup-body-md">
                <h3 class="popup-title">Add New Address</h3>
                <form action="{{ route('admin.ajax.whitelist.add') }}" method="POST" class="adduser-form validate-modern" id="addUserForm" autocomplete="false">
                    @csrf
                    <div class="input-item input-with-label">
                        <label class="input-item-label">Wallet Address</label>
                        <div class="input-wrap">
                            <input name="address" class="input-bordered" minlength="3" required="required" type="text" placeholder="Wallet Address">
                        </div>
                    </div>
                    <div class="gaps-1x"></div>
                    <button class="btn btn-md btn-primary" type="submit">Add Address</button>
                </form>
            </div>
        </div>
        {{-- .modal-content --}}
    </div>
    {{-- .modal-dialog --}}
</div>

@endsection