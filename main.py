import asyncio
from aiohttp import web
from tqdm import tqdm
from time import sleep
import os

os.system("pip3 install -r requirements.txt")

async def handle(request):
    print(f"\n\t [INFO] Handling request from {request.remote}")
    return web.Response(text="Congratulations ! You have the started the web server.")

async def start_background_tasks(app):
    # This function runs the background task
    async def background_task():
        print(f"\n\t Dayum ! Server is running on http://localhost:8000/")
        await asyncio.sleep(1)
        print(f"\n\t Please Wait .... ")

        for i in tqdm(range(6), desc="Processing"):
            # Simulating some time-consuming operation
            sleep(0.1)
        
        await asyncio.sleep(1)
        print(f"\n\t >>> Jobs Done ! <<< \n")

    app['background_task'] = asyncio.create_task(background_task())

async def cleanup_background_tasks(app):
    app['background_task'].cancel()
    await app['background_task']

app = web.Application()
app.add_routes([web.get('/', handle)])
app.on_startup.append(start_background_tasks)
app.on_cleanup.append(cleanup_background_tasks)

if __name__ == "__main__":
    web.run_app(app, host="localhost", port=8000)
