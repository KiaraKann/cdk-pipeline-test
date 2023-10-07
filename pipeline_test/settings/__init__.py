import os

try:
    if os.environ['CDKPROJ_ENV'] == 'DEV':
        from .dev import *
    elif os.environ['CDKPROJ_ENV'] == 'TEST':
        from .test import *
    elif os.environ['CDKPROJ_ENV'] == 'PROD':
        from .prod import *
    else:
        raise EnvironmentError(('Please add environ \'CDKPROJ_ENV\' to start using the service.\n\
        The value could be:\n\
            DEV\n\)'))
except EnvironmentError:
    raise Exception('Missing Environement Values')
