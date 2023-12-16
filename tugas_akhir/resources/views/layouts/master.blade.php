<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
    <script src="{{asset('js/bootstrap.bundle.min.js')}}"></script>
    <title>HRD</title>
</head>
<body>
    
    @yield('master-content')

    @if($errors->any())
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div id="messageErrorToast" class="toast text-bg-danger" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <strong class="me-auto">Error</strong>
                    <small>now</small>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">
                    <ul class="list-group">
                        @foreach($errors->all() as $error)
                            <li class="list-group-item">{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    @endif

    @if(session('success'))
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div id="messageSuccessToast" class="toast text-bg-success" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <strong class="me-auto">Success!</strong>
                    <small>now</small>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">
                    {{ session('success') }}
                </div>
            </div>
        </div>
    @endif
    
    <script>
        const messageErrorToast = document.getElementById('messageErrorToast');
        const errorToast = bootstrap.Toast.getOrCreateInstance(messageErrorToast);

        const messageSuccessToast = document.getElementById('messageSuccessToast');
        const successToast = bootstrap.Toast.getOrCreateInstance(messageSuccessToast);
        
        @if($errors->any())
            errorToast.show();
        @endif

        @if(session('success'))
            successToast.show();
        @endif
    </script>
</body>
</html>