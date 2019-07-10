
# Start Gunicorn processes
echo Starting Gunicorn.
PYTHONPATH=`pwd`/.. gunicorn --bind 0.0.0.0:3000 helloworld.wsgi:application




