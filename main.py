import asyncio
from tqdm import tqdm
from time import sleep

async def main():  
    print(f"\n\t Dayum ! Server is running on http://localhost:8000/")
    await asyncio.sleep(1)
    print(f"\n\t Please Wait .... ")

    for i in tqdm(range(6), desc="Processing"):
        # Simulating some time-consuming operation
        sleep(0.1)
    
    await asyncio.sleep(1)
    print(f"\n\t >>> Jobs Done ! <<< \n")

if __name__ == "__main__":
    asyncio.run(main())
