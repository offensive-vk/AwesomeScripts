import asyncio

async def main():  
    print(f"\n\t Dayum ! Server is running on http://localhost:8000/")
    await asyncio.sleep(1.50)
    print(f"\n\t Please Wait .... ")
    await asyncio.sleep(1.50)
    print(f"\n\t >>> Jobs Done ! <<< \n")

if __name__ == "__main__":
    asyncio.run(main())
