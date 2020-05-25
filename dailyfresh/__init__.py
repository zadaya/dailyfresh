#
# def isKeyProcess():
#     import os
#     return os.environ.get('RUN_MAIN') == 'true'
#
#
# if isKeyProcess():
#     print('**************\n启动Celery——worker\n**************')
#     import subprocess
#
#     # subprocess.Popen('ping baidu.com', shell=True)
#     subprocess.Popen('celery -A celery_tasks.tasks worker', shell=True)
