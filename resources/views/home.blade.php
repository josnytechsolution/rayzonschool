@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card bg-warning">
                <div class="card-header">Dear {{ Auth::user()->name }}</div>

                <div class="card-body">
                    @if (session('message'))
                        <div class="alert alert-success" role="alert">
                            {{ session('message') }}
                        </div>
                    @endif

                    <h4>You are not allowed to use this portal! Kindly login via the correct portal!</h4>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
