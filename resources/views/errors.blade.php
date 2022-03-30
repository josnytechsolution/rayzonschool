@if ($errors->any())
    <div class="alert alert-danger">
        @foreach ($errors->all() as $error)
            <p class="mb-0 mt-0">{{ $error }}</p>
        @endforeach
    </div>
@endif

@if (\Session::has('error'))
    <div class="alert alert-danger">
        <ul>
            <p class="mb-0 mt-0">{!! \Session::get('error') !!}</p>
        </ul>
    </div>
@endif

@if($message = Session::get('failed'))
    <div class="col-12 alert alert-danger">
        {{ $message }}
    </div>
@endif


@if($message = Session::get('success'))
    <div class="col-12 alert alert-success alerts">
        {{ $message }}
    </div>
@endif

@if($message = Session::get('welcome'))
    <div class="col-12 alert alert-info">
        {{ $message }}
    </div>
@endif