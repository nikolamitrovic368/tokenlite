@php 
$cur = strtolower($transaction->currency); 
$cur_U = strtoupper($cur);
$wallet_name = short_to_full($cur);
$wallet_icon = (in_array($cur, ['cad', 'aud', 'nzd', 'nad', 'kes', 'zar', 'clp', 'cop', 'jmd'])) ? 'usd' : (($cur=='egp') ? 'gbp' : $cur);

$pm = manual_payment($cur, 'array');
$ext_limit = (!empty($pm) && isset($pm->limit)) ? $pm->limit : '';
$ext_price = (!empty($pm) && isset($pm->price)) ? $pm->price : '';
$ext_field = (!empty($pm) && isset($pm->req)) ? $pm->req : false;

$_type = (!empty($pm) && isset($pm->network)) ? $pm->network : '';
$_address = (!empty($pm) && isset($pm->address)) ? $pm->address : '';
$_note = (!empty($pm) && isset($pm->note)) ? $pm->note : '';
$_amount = to_num($transaction->amount, 'max');
$text = strtolower(str_replace(' ', '-', $wallet_name)).':'.$_address.'?amount='.$_amount;
$num = (!empty($pm) && isset($pm->num) && !empty($pm->num)) ? $pm->num : 3;
@endphp


<div class="popup-body">
    <h4 class="popup-title">{{__('Confirmation Your Payment')}}</h4>
    <div class="popup-content">
        <p class="lead-lg text-primary">{!! __('Your Order no. :orderid has been placed successfully.', ['orderid' => '<strong>'.$transaction->tnx_id.'</strong>' ]) !!}</p>
        <p>{!! __('Please send :amount :currency to the address below. The token balance will appear in your account only after transaction gets :num confirmation and approved by our team.', ['num' => $num, 'amount' => '<strong class="text-primary">'.to_num($transaction->amount, 'max').'</strong>', 'currency' => '<strong class="text-primary">'.strtoupper($transaction->currency).'</strong>']) !!}</p>
        @if(is_payment_method_exist('manual') )
            @if(!empty($_address) && isset($transaction->payment_to) && $transaction->payment_to != null)
            <div class="gaps-1x"></div>
            <div class="pay-wallet-address pay-wallet-{{ $cur }}">
                <h6 class="font-bold">{{ __('Payment to the following :Name Wallet Address', ['name' => ($_type == 'default' || empty($_type)) ? $wallet_name : $wallet_name.' ('.__(short_to_full($_type)).')' ])}}</h6>
                <div class="row guttar-1px guttar-vr-15px">
                    {{-- <div class="col-sm-2">
                        <p class="text-center text-sm-left"><img title="{{ __("Scan QR code to payment.") }}" class="img-thumbnail" width="82" src="{{ route('public.qrgen', ['text'=>$text]) }}" alt=""></p>
                    </div> --}}
                    <div class="col-sm-10">
                        <div class="fake-class pl-sm-3">
                            <p class="text-center text-sm-left mb-2"><strong>{{ __('Send Amount:') }}<br class="d-block d-sm-none">
                                <span class="fs-16 text-primary">{{ to_num($transaction->amount, 'max') . ' ' .$cur_U }}</span>
                            </strong></p>
                            <div class="copy-wrap mgb-0-5x">
                                <span class="copy-feedback"></span>
                                <em class="copy-icon ikon ikon-sign-{{ $wallet_icon }}"></em>
                                <input type="text" class="copy-address ignore" value="{{ $_address }}" disabled="" readonly="">
                                <button type="button" class="copy-trigger copy-clipboard" data-clipboard-text="{{ $_address }}"><em class="ti ti-files"></em></button>
                            </div>
                            @if( ($ext_limit || $ext_price)  && strtolower($transaction->currency)=='eth' )
                                <ul class="pay-info-list row">
                                    @if($ext_limit)
                                    <li class="col-sm-6"><span>{{__('SET GAS LIMIT:')}}</span> {{ $ext_limit }}</li>
                                    @endif
                                    @if($ext_price)
                                    <li class="col-sm-6"><span>{{__('SET GAS PRICE:')}}</span> {{ $ext_price }} {{__('Gwei')}}</li>
                                    @endif
                                </ul>
                            @endif
                            @if($_note)
                                <div class="input-note">
                                    <p><strong>{{ __($_note) }}</strong></p>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            @endif
        @endif 
        <div class="gaps-2x"></div>
        <form action="{{ route('payment.manual.update') }}" method="POST" id="payment-confirm" class="validate-modern" autocomplete="off">
            @csrf
            <input type="hidden" name="trnx_id" value="{{ $transaction->id }}">
            <p class="text-head"><strong>{{ __("To speed up verification process please enter your wallet address from where you'll transferring your amount to our address.") }}</strong></p>
            <div class="input-item input-with-label">
                <input id="token-address" type="text" name="payment_address" class="input-bordered" placeholder="{{ __('Insert your payment address').(($ext_field=='yes') ? ' *' : '') }}"{{ ($ext_field=='yes' ? ' required' : '') }} >
            </div>
            <ul class="d-flex flex-wrap align-items-center guttar-30px">
                <li><button type="submit" name="action" value="confirm" class="btn btn-primary payment-btn">{{__('Confirm Payment')}}</button></li> 
                <li class="pdt-1x pdb-1x"><button type="submit" name="action" value="cancel" class="btn btn-cancel btn-danger-alt payment-cancel-btn payment-btn btn-simple">{{__('Cancel Order')}}</button></li>
            </ul>
            @if($ext_field != 'yes')
            <p class="mt-1"><a class="link" href="{{ route('user.transactions') }}">{{ __("I'll provide wallet address later") }}</a></p>
            @endif
        </form>
        <div class="gaps-2-5x"></div>
        <div class="note note-info note-plane">
            <em class="fas fa-info-circle"></em> 
            <p>{{__('Do not make payment through exchange (Kraken, Bitfinex). You can use MyEtherWallet, MetaMask, Mist wallets etc.')}}</p>
        </div>
        <div class="gaps-1x"></div>
        <div class="note note-danger note-plane">
            <em class="fas fa-info-circle"></em> 
            <p>{{ __('In case you send a different amount, number of :SYMBOL token will update accordingly.', ['symbol' => token_symbol()]) }}</p>
        </div>
    </div>
</div>
<script type="text/javascript">
    (function($) {
        var $_p_form = $('form#payment-confirm'), _url = "{{ route('payment.manual.notify') }}", 
            _data = { tnx: {{ $transaction->id }}, notify: "{{ $mailed['notify'] }}", user: "{{ $mailed['user'] }}", system: "{{ $mailed['system'] }}" };
        if(_url && _data) { ajax_email(_url, _data); }
        if ($_p_form.length > 0) { purchase_form_submit($_p_form); }
        var clipboardModal = new ClipboardJS('.copy-trigger', { container: document.querySelector('.modal') });
        clipboardModal.on('success', function(e) { e.clearSelection(); }).on('error', function(e) { feedback(e.trigger, 'fail'); });
    })(jQuery);
</script>