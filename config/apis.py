from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt


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


@csrf_exempt
def issue_webhook(request):
    print(request.data)
    return JsonResponse({
        'success': True,
        'message': 'Oauth Success !',
    })
