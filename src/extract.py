import requests

def download_dataset(url: str, path: str) -> None:
    """
    Downloads the dataset from the provided URL and saves it to the specified path.
    """
    response = requests.get(url)
    response.raise_for_status()  
    
    with open(path, 'wb') as f:
        f.write(response.content)
    print(f"Dataset downloaded and saved to {path}")

if __name__ == "__main__":
    dataset_url = 'https://ai-jobs.net/salaries/download/salaries.csv' 
    file_path = './data/ExtractedSalaries.csv'  
    download_dataset(dataset_url, file_path)
