from django.http import JsonResponse


def home(request):
    return JsonResponse({
        'success': True,
        'message': 'Oauth Success !',
    })


def bind_webhook(request):
    return JsonResponse({
        'success': True,
        'message': 'Oauth Success !',
    })


def issue_webhook(request):
    print(request.data)
    return JsonResponse({
        'success': True,
        'message': 'Oauth Success !',
    })
