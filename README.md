# tj-bat-utilities

> Welcome to tj-bat-utilities!
<br>
> 
> This repository is your go-to collection of handy batch (.bat) scripts designed to simplify your daily tasks and enhance your productivity. From opening multiple Chrome tabs to managing ADB utilities and organizing your folders, these scripts are crafted to make your life easier.

---

### 20may25_305pm

- `generate_files_for_whole_month_excluding_weekends_dynamic.bat`
    - This script generates markdown (`.md`) files for each day of a specified month and year by copying a template file present in the same folder.
    - **Highly configurable:**  
        - **Month and Year:** Easily set in the configuration section.
        - **Exclude Weekends:** Toggle whether to skip weekends (Saturday and Sunday) or include all days.
        - **Leading Zero:** Choose whether the day in the filename has a leading zero (e.g., `01_Aug_2025.md`) or not (`1_Aug_2025.md`).
        - **Month Name Format:**  
            - Use the full month name (e.g., `August`) or a 3-letter abbreviation (e.g., `Aug`).
                - Variable Values `3` | `full`
            - Set the case for the month name: all uppercase (`AUG`), all lowercase (`aug`), or title case (`Aug`).
                - Variable Values `title` | `lower` | `upper`
    - **Filename examples:**  
        - `01_Aug_2025.md`, `01_aug_2025.md`, `1_AUG_2025.md`, `1_Aug_2025.md`,`1_August_2025.md` (all formats are possible via configuration).
    - **Usage:**  
        - Edit the configuration section at the top of the script to set your preferences before running.
- Old script is updated as it generate files for may 2025 only and too much static.

### 1may25_1216pm
- `generate_files_for_whole_month.bat`
    - This script generates md files for each day of a specified month and year ( INCLUDING WEEKEND DATES) by copying the template file present in same folder.
- `generate_files_for_whole_month_excluding_weekends.bat`
    - This script generates md files for each day of a specified month and year ( EXCLUDING WEEKEND DATES ) by copying the template file present in same folder.

### 16jan25_430pm
`check_helpdesk_tickets_without_missing.bat`
- Opens specific chrome URl at specified time duration to check out things without missing them.

### 15jan25_1240pm
`drink_water_reminder.bat`
- This bat file reminds you for drinking water every 30 mins

### 7jan25
`make admin yearly folder`
- I created this bat file for my admin related work where i have to kept bills in gdrive for every month with GST or non gst category 
- So this bat file will make yearly folder with months folder inside it and each monthly folder has specfic folders to log every months data
- NOte:
    - for now it has code to generate folders for year `2025`, if you need for any other year, replace 2025 with your year in whole file. 🤭.

