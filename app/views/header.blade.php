@extends('master')


@section('head')
<meta name="csrf-token" content="<?= csrf_token() ?>">

<script src="{{ asset('vendor/jquery-ui/ui/minified/jquery-ui.min.js') }}" type="text/javascript"></script>				
<script src="{{ asset('vendor/bootstrap/dist/js/bootstrap.min.js') }}" type="text/javascript"></script>				
<script src="{{ asset('vendor/datatables/media/js/jquery.dataTables.js') }}" type="text/javascript"></script>
<script src="{{ asset('vendor/datatables-bootstrap3/BS3/assets/js/datatables.js') }}" type="text/javascript"></script>
<script src="{{ asset('vendor/knockout.js/knockout.js') }}" type="text/javascript"></script>
<script src="{{ asset('vendor/knockout-mapping/build/output/knockout.mapping-latest.js') }}" type="text/javascript"></script>
<script src="{{ asset('vendor/knockout-sortable/build/knockout-sortable.min.js') }}" type="text/javascript"></script>
<script src="{{ asset('vendor/underscore/underscore.js') }}" type="text/javascript"></script>		
<script src="{{ asset('vendor/bootstrap-datepicker/js/bootstrap-datepicker.js') }}" type="text/javascript"></script>		
<script src="{{ asset('vendor/typeahead.js/dist/typeahead.min.js') }}" type="text/javascript"></script>	
<script src="{{ asset('vendor/accounting/accounting.min.js') }}" type="text/javascript"></script>		
<script src="{{ asset('js/bootstrap-combobox.js') }}" type="text/javascript"></script>		
<script src="{{ asset('js/jspdf.source.js') }}" type="text/javascript"></script>		
<script src="{{ asset('js/jspdf.plugin.split_text_to_size.js') }}" type="text/javascript"></script>   
<script src="{{ asset('js/script.js') }}" type="text/javascript"></script>		

<link href="{{ asset('vendor/bootstrap/dist/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css"/> 
<link href="{{ asset('vendor/datatables/media/css/jquery.dataTables.css') }}" rel="stylesheet" type="text/css">
<link href="{{ asset('vendor/datatables-bootstrap3/BS3/assets/css/datatables.css') }}" rel="stylesheet" type="text/css">    
<link href="{{ asset('vendor/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet" type="text/css"/>
<link href="{{ asset('vendor/bootstrap-datepicker/css/datepicker.css') }}" rel="stylesheet" type="text/css"/>	
<link href="{{ asset('css/bootstrap-combobox.css') }}" rel="stylesheet" type="text/css"/>	
<link href="{{ asset('css/typeahead.js-bootstrap.css') }}" rel="stylesheet" type="text/css"/>			
<link href="{{ asset('css/style.css') }}" rel="stylesheet" type="text/css"/>    


<style type="text/css">

  body {
    /* background-color: #F6F6F6; */
    background-color: #EEEEEE;
  }

</style>

<script type="text/javascript">

  var currencies = {{ Currency::remember(120)->get(); }};
  var currencyMap = {};
  for (var i=0; i<currencies.length; i++) {
    var currency = currencies[i];
    currencyMap[currency.id] = currency;
  }				
  var NINJA = NINJA || {};
  NINJA.parseFloat = function(str) {
    if (!str) return '';
    str = (str+'').replace(/[^0-9\.\-]/g, '');
    return window.parseFloat(str);
  }
  function formatMoney(value, currency_id, hide_symbol) {
    value = NINJA.parseFloat(value);
    if (!currency_id) currency_id = {{ Session::get(SESSION_CURRENCY, DEFAULT_CURRENCY); }};
    var currency = currencyMap[currency_id];
    return accounting.formatMoney(value, hide_symbol ? '' : currency.symbol, currency.precision, currency.thousand_separator, currency.decimal_separator);
  }

  /* Set the defaults for DataTables initialisation */
  $.extend( true, $.fn.dataTable.defaults, {
    "sDom": "t<'row-fluid'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap",
    "bInfo": true,
    "oLanguage": {
      'sEmptyTable': "{{ trans('texts.empty_table') }}",
      'sLengthMenu': '_MENU_',
      'sSearch': ''
    }
  } );

</script>
@stop

@section('body')

<p>&nbsp;</p>
<p>&nbsp;</p>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container">

    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="{{ URL::to('/') }}" class='navbar-brand'>
        CEDASE
      </a>	    
    </div>

    @if (Auth::check())
    <div class="collapse navbar-collapse" id="navbar-collapse-1">
      <ul class="nav navbar-nav" style="font-weight: bold">
        {{ HTML::nav_link('dashboard', 'dashboard') }}
        {{ HTML::menu_link('client') }}
        {{ HTML::menu_link('invoice') }}
        {{ HTML::menu_link('payment') }}
        {{ HTML::menu_link('credit') }}
        {{-- HTML::nav_link('reports', 'Reports') --}}
      </ul>

      <div class="navbar-form navbar-right">
        @if (Auth::check() && !Auth::user()->registered)
        {{ Button::sm_success_primary(trans('texts.sign_up'), array('id' => 'signUpButton', 'data-toggle'=>'modal', 'data-target'=>'#signUpModal')) }} &nbsp;
        @endif

        @if (Auth::user()->getPopOverText() && !Utils::isRegistered())
        <button id="ninjaPopOver" type="button" class="btn btn-default" data-toggle="popover" data-placement="bottom" data-content="{{ Auth::user()->getPopOverText() }}" data-html="true" style="display:none">
          {{ trans('texts.sign_up') }}
        </button>
        @endif

        @if (Auth::user()->getPopOverText())
        <script>
          $(function() {
            $('#ninjaPopOver').show().popover('show').hide();
            $('body').click(function() {
              $('#ninjaPopOver').popover('hide');
            });    
          });
        </script>
        @endif

        <div class="btn-group">
          <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
            <span id="myAccountButton">
              {{ Auth::user()->getDisplayName() }}
            </span>
            <span class="caret"></span>
          </button>			
          <ul class="dropdown-menu" role="menu">
            <li>{{ link_to('company/details', uctrans('texts.company_details')) }}</li>
            <li>{{ link_to('company/payments', uctrans('texts.online_payments')) }}</li>
            <li>{{ link_to('company/notifications', uctrans('texts.notifications')) }}</li>
            <li>{{ link_to('company/import_export', uctrans('texts.import_export')) }}</li>
            <!--<li><a href="{{ url('company/custom_fields') }}">{{ uctrans('texts.custom_fields') . Utils::getProLabel(ACCOUNT_CUSTOM_FIELDS) }}</a></li>-->

            <li class="divider"></li>
            <li>{{ link_to('#', trans('texts.logout'), array('onclick'=>'logout()')) }}</li>
          </ul>
        </div>


        @if (Auth::user()->getPopOverText() && Utils::isRegistered())
        <button id="ninjaPopOver" type="button" class="btn btn-default" data-toggle="popover" data-placement="bottom" data-content="{{ Auth::user()->getPopOverText() }}" data-html="true" style="display:none">
          {{ Auth::user()->getDisplayName() }}
        </button>
        @endif



      </div>	


      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" id="search" class="form-control" placeholder="{{ trans('texts.search') }}">
        </div>
      </form>

      <ul class="nav navbar-nav navbar-right">	      
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{ trans('texts.history') }} <b class="caret"></b></a>
          <ul class="dropdown-menu">	        		        	
            @if (count(Session::get(RECENTLY_VIEWED)) == 0)
            <li><a href="#">{{ trans('texts.no_items') }}</a></li>
            @else
            @foreach (Session::get(RECENTLY_VIEWED) as $link)
            <li><a href="{{ $link->url }}">{{ $link->name }}</a></li>	
            @endforeach
            @endif
          </ul>
        </li>
      </ul>
      @endif      

    </div><!-- /.navbar-collapse -->


  </div>
</nav>



<br/>
<div class="container">		

  @if (!isset($showBreadcrumbs) || $showBreadcrumbs)
  {{ HTML::breadcrumbs() }}
  @endif

  @if (Session::has('warning'))
  <div class="alert alert-warning">{{ Session::get('warning') }}</div>
  @endif

  @if (Session::has('message'))
  <div class="alert alert-info">{{ Session::get('message') }}</div>
  @endif

  @if (Session::has('error'))
  <div class="alert alert-danger">{{ Session::get('error') }}</div>
  @endif

  @yield('content')		

</div>
<div class="container">
  <div class="footer" style="padding-top: 32px">
    @if (false)
    <div class="pull-right">
      {{ Former::open('user/setTheme')->addClass('themeForm') }}
      <div style="display:none">
        {{ Former::text('theme_id') }}
        {{ Former::text('path')->value(Request::url()) }}
      </div>
      <div class="btn-group tr-action dropup">
        <button type="button" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown">
          Site Theme <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" role="menu">
          <li><a href="#" onclick="setTheme(0)">Default</a></li>
          @foreach (Theme::remember(DEFAULT_QUERY_CACHE)->get() as $theme)
          <li><a href="#" onclick="setTheme({{ $theme->id }})">{{ ucwords($theme->name) }}</a></li>
          @endforeach
        </ul>
      </div>
      {{ Former::close() }}	      	
    </div>
    @endif

<!--
Want something changed? We're {{ link_to('https://github.com/hillelcoren/invoice-ninja', 'open source', array('target'=>'_blank')) }}, email us at {{ link_to('mailto:contact@invoiceninja.com', 'contact@invoiceninja.com') }}.			
-->

</div>			
</div>
</div>


@if (!Auth::check() || !Auth::user()->registered)
<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="signUpModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">{{ trans('texts.sign_up') }}</h4>
      </div>

      <div style="background-color: #fff; padding-right:20px" id="signUpDiv" onkeyup="validateSignUp()" onclick="validateSignUp()" onkeydown="checkForEnter(event)">
        <br/>

        {{ Former::open('signup/submit')->addClass('signUpForm') }}

        @if (Auth::check())
        {{ Former::populateField('new_first_name', Auth::user()->first_name); }}
        {{ Former::populateField('new_last_name', Auth::user()->last_name); }}
        {{ Former::populateField('new_email', Auth::user()->email); }}	    		
        @endif

        <div style="display:none">
          {{ Former::text('path')->value(Request::path()) }}
          {{ Former::text('go_pro') }}
        </div>

        {{ Former::text('new_first_name')->label(trans('texts.first_name')) }}
        {{ Former::text('new_last_name')->label(trans('texts.last_name')) }}
        {{ Former::text('new_email')->label(trans('texts.email')) }}	    	
        {{ Former::password('new_password')->label(trans('texts.password')) }}        
        {{ Former::checkbox('terms_checkbox')->label(' ')->text(trans('texts.agree_to_terms', ['terms' => '<a href="'.URL::to('terms').'" target="_blank">'.trans('texts.terms_of_service').'</a>'])) }}
        {{ Former::close() }}

        <center><div id="errorTaken" style="display:none">&nbsp;<br/>{{ trans('texts.email_taken') }}</div></center>
        <br/>


      </div>

      <div style="padding-left:40px;padding-right:40px;display:none;min-height:130px" id="working">
        <h3>{{ trans('texts.working') }}...</h3>
        <div class="progress progress-striped active">
          <div class="progress-bar"  role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
        </div>
      </div>

      <div style="background-color: #fff; padding-right:20px;padding-left:20px; display:none" id="signUpSuccessDiv">
        <br/>
        <h3>{{ trans('texts.success') }}</h3>
        {{ trans('texts.success_message') }}<br/>&nbsp;
      </div>


      <div class="modal-footer" id="signUpFooter" style="margin-top: 0px">	      	
        <button type="button" class="btn btn-default" data-dismiss="modal">{{ trans('texts.close') }} <i class="glyphicon glyphicon-remove-circle"></i></button>
        <button type="button" class="btn btn-primary" id="saveSignUpButton" onclick="validateServerSignUp()" disabled>{{ trans('texts.save') }} <i class="glyphicon glyphicon-floppy-disk"></i></button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">{{ trans('texts.logout') }}</h4>
      </div>

      <div class="container">	     
        <h3>{{ trans('texts.are_you_sure') }}</h3>
        <p>{{ trans('texts.erase_data') }}</p>	      	
      </div>

      <div class="modal-footer" id="signUpFooter">	      	
        <button type="button" class="btn btn-default" data-dismiss="modal">{{ trans('texts.cancel') }}</button>
        <button type="button" class="btn btn-primary" onclick="logout(true)">{{ trans('texts.logout') }}</button>	      	
      </div>
    </div>
  </div>
</div>
@endif

@if (Auth::check() && !Auth::user()->isPro())
  <div class="modal fade" id="proPlanModal" tabindex="-1" role="dialog" aria-labelledby="proPlanModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="min-width:150px">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="proPlanModalLabel">{{ trans('texts.pro_plan_product') }}</h4>
        </div>

        <div style="background-color: #fff; padding-left: 16px; padding-right: 16px" id="proPlanDiv">
          &nbsp; 
          {{-- trans('texts.') --}}
          &nbsp;
      </div>


      <div style="padding-left:40px;padding-right:40px;display:none;min-height:130px" id="proPlanWorking">
        <h3>{{ trans('texts.working') }}...</h3>
        <div class="progress progress-striped active">
          <div class="progress-bar"  role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
        </div>
      </div>

      <div style="background-color: #fff; padding-right:20px;padding-left:20px; display:none" id="proPlanSuccess">
        &nbsp;<br/>
        {{ trans('texts.pro_plan_success') }}
        <br/>&nbsp;
      </div>

       <div class="modal-footer" style="margin-top: 0px" id="proPlanFooter">
          <button type="button" class="btn btn-default" data-dismiss="modal">{{ trans('texts.close') }}</button>          
          <button type="button" class="btn btn-primary" id="proPlanButton" onclick="submitProPlan()">{{ trans('texts.sign_up') }}</button>                    
       </div>     
      </div>
    </div>
  </div>


@endif


<p>&nbsp;</p>

</body>


<script type="text/javascript">

  function setTheme(id)
  {
    $('#theme_id').val(id);
    $('form.themeForm').submit();
  }

  @if (!Auth::check() || !Auth::user()->registered)
  function validateSignUp(showError) 
  {
    var isFormValid = true;
    $(['first_name','last_name','email','password']).each(function(i, field) {
      var $input = $('form.signUpForm #new_'+field),
      val = $.trim($input.val());
      var isValid = val && val.length >= (field == 'password' ? 6 : 1);
      if (isValid && field == 'email') {
        isValid = isValidEmailAddress(val);
      }
      if (isValid) {
        $input.closest('div.form-group').removeClass('has-error').addClass('has-success');
      } else {
        isFormValid = false;
        $input.closest('div.form-group').removeClass('has-success');
        if (showError) {
          $input.closest('div.form-group').addClass('has-error');
        }
      }
    });

    if (!$('#terms_checkbox').is(':checked')) {
      isFormValid = false;
    }

    $('#saveSignUpButton').prop('disabled', !isFormValid);

    return isFormValid;
  }

  function validateServerSignUp()
  {
    if (!validateSignUp(true)) {
      return;
    }

    $('#signUpDiv, #signUpFooter').hide();
    $('#working').show();

    $.ajax({
      type: 'POST',
      url: '{{ URL::to('signup/validate') }}',
      data: 'email=' + $('form.signUpForm #new_email').val(),
      success: function(result) { 
        if (result == 'available') {						
          submitSignUp();
        } else {
          $('#errorTaken').show();
          $('form.signUpForm #new_email').closest('div.form-group').removeClass('has-success').addClass('has-error');
          $('#signUpDiv, #signUpFooter').show();
          $('#working').hide();
        }
      }
    });			
  }

  function submitSignUp() {
    $.ajax({
      type: 'POST',
      url: '{{ URL::to('signup/submit') }}',
      data: 'new_email=' + encodeURIComponent($('form.signUpForm #new_email').val()) + 
      '&new_password=' + encodeURIComponent($('form.signUpForm #new_password').val()) + 
      '&new_first_name=' + encodeURIComponent($('form.signUpForm #new_first_name').val()) + 
      '&new_last_name=' + encodeURIComponent($('form.signUpForm #new_last_name').val()) +
      '&go_pro=' + $('#go_pro').val(),
      success: function(result) { 
        if (result) {
          localStorage.setItem('guest_key', '');
          NINJA.isRegistered = true;
          $('#signUpButton').hide();
          $('#myAccountButton').html(result);                            
        }            
        $('#signUpSuccessDiv, #signUpFooter').show();
        $('#working, #saveSignUpButton').hide();
      }
    });     
  }      

  function checkForEnter(event)
  {
    if (event.keyCode === 13){
      event.preventDefault();		     	
      validateServerSignUp();
      return false;
    }
  }
  @endif

  function logout(force)
  {
    if (force) {
      NINJA.formIsChanged = false;
    }

    if (force || NINJA.isRegistered) {            
      window.location = '{{ URL::to('logout') }}';
    } else {
      $('#logoutModal').modal('show');	
    }
  }

  @if (Auth::check() && !Auth::user()->isPro())
  function showProPlan() {
    $('#proPlanModal').modal('show');       
  }

  function submitProPlan() {

    if (NINJA.isRegistered) {
      $('#proPlanDiv, #proPlanFooter').hide();
      $('#proPlanWorking').show();

      $.ajax({
        type: 'POST',
        url: '{{ URL::to('account/go_pro') }}',
        success: function(result) { 
          $('#proPlanSuccess, #proPlanFooter').show();
          $('#proPlanWorking, #proPlanButton').hide();
        }
      });     
    } else {
      $('#proPlanModal').modal('hide');
      $('#go_pro').val('true');
      showSignUp();
    }
  }
  @endif


  $(function() {
    $('#search').focus(function(){
      if (!window.hasOwnProperty('searchData')) {
        $.get('{{ URL::route('getSearchData') }}', function(data) {  						
          window.searchData = true;						
          var datasets = [];
          for (var type in data)
          {  							
            if (!data.hasOwnProperty(type)) continue;  							
            datasets.push({
              name: type,
              header: '&nbsp;<b>' + type  + '</b>',  								
              local: data[type]
            });  														
          }
          if (datasets.length == 0) {
            return;
          }
          $('#search').typeahead(datasets).on('typeahead:selected', function(element, datum, name) {
            var type = name == 'Contacts' ? 'clients' : name.toLowerCase();
            window.location = '{{ URL::to('/') }}' + '/' + type + '/' + datum.public_id;
          }).focus().typeahead('setQuery', $('#search').val());  						
        });
      }
    });


    if (isStorageSupported()) {
      @if (Auth::check() && !Auth::user()->registered)
      localStorage.setItem('guest_key', '{{ Auth::user()->password }}');
      @endif
    }

    @if (!Auth::check() || !Auth::user()->registered)
    validateSignUp();

    $('#signUpModal').on('shown.bs.modal', function () {
      $(['first_name','last_name','email','password']).each(function(i, field) {
        var $input = $('form.signUpForm #new_'+field);
        if (!$input.val()) {
          $input.focus();	  					
          return false;
        }
      });
    })
    @endif

    @yield('onReady')

  });

</script>  


@stop