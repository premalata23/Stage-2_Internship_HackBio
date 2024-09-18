# **LabDash User Manual:  A Comprehensive Laboratory Dashboard**
## **Authors ([@slack](https://app.slack.com/client/T07DGMU5S6L/D07K3R60MEE))**
- Dua Gulzar ([@Dua](https://hackbiointern-leo4437.slack.com/team/U07K6A4L18C))
- Premalata Pati ([@Premalata](https://hackbiointern-leo4437.slack.com/team/U07JD8NKQ30))
- Hana Mahmoud Mazroua ([@Mazroua](https://hackbiointern-leo4437.slack.com/team/U07K7K6PVKQ))
- Nourhan Adel ElHifnawy ([@Hifnawy](https://hackbiointern-leo4437.slack.com/team/U07L328NPHN))
- Jesse Frank Juma ([@jesse](https://hackbiointern-leo4437.slack.com/team/U07K64WPXU0))

## **Introduction**
**LabDash** is a professional-grade, web-based R Shiny dashboard that automates essential laboratory calculations. The dashboard includes five primary calculators, designed for laboratory scientists and researchers, to streamline complex laboratory procedures with accuracy and efficiency. This manual provides step-by-step guidance on how to use each calculator effectively.

## **Table of Contents**
**1.**	Serial Dilution Calculator\
**2.**	Stock Solution Dilution Calculator\
**3.**	Buffer Preparation Calculator\
**4.**	Colony Forming Units (CFUs) Calculator\
**5.**	MTT Assay Cell Viability Calculator\
**6.**	Accessing the Dashboard\
**7.**	Troubleshooting and Error Handling\
**8.**	Hosting and Access

## **Accessing the Dashboard**
To access **LabDASH**, [Click here](https://lab-dash.shinyapps.io/Lab-Dash/). The dashboard provides a professional interface with interactive tools that are accessible across devices. The tools are intuitive and designed with error handling to ensure reliable and precise results.

## **1. Serial Dilution Calculator**

### **Overview**
This calculator determines the volumes required for serial dilutions to lower solution concentrations. The tool provides both tabular and graphical outputs showing concentration changes across dilution steps.

### **Mathematical Formula**
The dilution formula, which connects concentrations and volumes before and after dilution, is the source of the mathematical formula used in the function to determine the volume to transfer at each dilution ste

>         C1×V1= C2×V2 

Where:\
•	**C1:** represents the solution's concentration before dilution. \
•	**V1:** represents the solution's volume before dilution. \
•	**C2:** the solution's concentration after dilution.\
•	**V2:** the volume of the solution in its whole after dilution

In this instance, the concentration following each dilution is determined by dividing the original concentration by the dilution factor because you're using a distinct dilution factor (DF) at each step: 

>          Ci+1= Ci / DF

Reorder dilution equation to find V transfer for preceding dilution step volume.

>     V transfer= C2×V2 / C1

### **How to use**
The calculator uses basic math to find the volume of solution needed for a given dilution, considering initial concentration, dilution factor, and total volume after dilution. This is repeated for each dilution stage to determine new concentrations and transfer volumes.
### **Use the Serial Dilution Calculator by doing the following actions:**
**1.** **_Initial Concentration:_** : Fill in the Initial Concentration field with the stock solution's concentration (in milligrams per milliliter). This is the concentration at which dilutions will be made initially. \
**2.** **_Dilution Factor:_** Enter the ratio by which you wish to lower the concentration, called the dilution factor. A typical value is 10, which indicates that the concentration of each new dilution will be one-tenth that of the preceding solution. \
**3.** **_Number of Dilutions:_** Indicate the number of times the solution has to be diluted. Entering 5, for example, will result in 5 dilution steps. \
**4.** **_Total Volume:_** After each dilution, record the solution's total volume (in milliliters). After transferring and diluting the stock solution, you want to have this volume.

### **Outputs**
Once the necessary data has been entered, the application generates two outputs: \
**1. Dilution Table:** Shows the volume of stock solution to be transferred as well as the concentration at each step. Every row represents a stage of dilution and illustrates: 

• Dilution Step: The dilution procedure's step number. \
•	Concentration: Following each stage, the concentration (in mg/mL) is stated. \
•	Volume to Transfer: The amount of stock solution to be transferred (in milliliters) for the subsequent dilution stage.

**2. Concentration Plot:** This is a graph that shows how concentration changes when dilution stages are taken, making it simple to see how concentration drops with each step.

**Error Handling:**

An error message will show up if you enter erroneous inputs (such as negative concentrations), assisting you in correcting the input.

**Example:**
To dilute a 100 mg/mL stock solution through five 1:10 serial dilutions with 10 mL total volume:

•	Initial concentration: 100 mg/mL\
•	Dilution factor: 10\
•	Number of dilutions: 5\
•	Total volume: 10 mL

The app will display the transfer volumes for each step and plot concentration changes.

## **2. Stock Solution Dilution Calculator**

### **Overview**
This tool calculates the volume of a stock solution required to prepare a specific diluted solution.
### **Mathematical Formula**
The calculator is based on the dilution formula:
> C1 × V1 = C2 × V2

Where:\
**•	C1** = Stock Concentration (M)\
**•	V1** = Required Volume of the stock solution (mL)\
**•	C2**= Desired final concentration (M)\
**•	V2** = Desired final volume (mL)

### **Calculation Logic**
This formula calculates how much stock solution is needed to prepare the diluted solution.
### **How to Use**
**Open the Calculator:** Go to the dashboard and select the Stock Solution Dilution tool.

**1. Input Fields:**

  •	**Stock Concentration (M):** Enter the concentration of your stock solution.\
•	**Final Concentration (M):** Enter the desired concentration of your diluted solution.\
•	**Final Volume (mL):** Enter the volume of the final solution you want to prepare.

**2.	Click "Calculate":** The tool will compute and display the required volume of the stock solution to achieve your desired dilution.

**3.	Outputs:** 

 •	**Required Volume of Stock Solution (mL):** The volume of the stock solution needed will be displayed.

 ### **Example**
 To prepare 100 mL of a 0.1 M solution from a 1 M stock:

•	Stock concentration: 1 M\
•	Final concentration: 0.1 M\
•	Final volume: 100 mL

The app will calculate and display the required stock volume (10 mL).

## **3. Buffer Preparation Calculator**
### **Overview**
This tool helps you prepare a buffer solution with a specific pH, using the **Henderson-Hasselbalch equation**.

### **Mathematical Formula**

>pH=pKa+log(([Base])/([Acid]))

Where:\
•**pH:** Desired pH\
•	**pKa:** Acid dissociation constant\
•	**[Base] and [Acid]:** Molar concentrations of the base and acid

### **Calculation Logic**
This ratio determines how much base is needed in relation to the acid to achieve the desired pH. The tool calculates this ratio using the inputted **pH** and **pKa** values.

### **How to Use**
**1. Open the Calculator:** Go to the dashboard and select the Buffer Preparation tool.

**2. Input Fields:**

•	**pKa of the Acid:** Enter the dissociation constant (pKa) of the acid you are using.\
•	**Desired pH:** Enter the pH you want for your buffer.\
•	**Acid Concentration (M):** Enter the molarity of the acid solution.\
•	**Base Concentration (M):** Enter the molarity of the base solution.\
•	**Total Volume of Buffer (mL):** Enter the total volume of the buffer solution you want to prepare.

**3. 	Click "Calculate":** The tool will compute the required base-to-acid ratio and display the results.

**4.	Outputs:**

•**Base-to-Acid Ratio:** This shows how much base is needed relative to the acid to achieve the desired pH.\
•	**Interactive Plot:** The plot dynamically shows the relationship between pH and the base-to-acid ratio.

### **Example**
For a buffer of pH 7.4 with an acid of pKa 4.75: Input 4.75 as the pKa.

•	pKa: 4.75\
•	pH: 7.4\
•	Acid/Base concentrations: 0.1 M\
•	Volume: 100 mL

The calculator will display the required base-to-acid ratio and update the plot accordingly.

### **Interactive Plot**

**NB:** The plot shows how the **base-to-acid ratio** changes with **pH**. Adjusting the pH, pKa, or concentrations updates the graph in real-time, providing a visual representation of the buffer’s behavior.

## **4. Colony Forming Units (CFUs) Calculator**

### **Overview**

This calculator determines the colony-forming units (CFUs) per milliliter of a sample based on the colony count, dilution factor, and plated volume.

### **Mathematical Formula**

The formula used to calculate CFU/mL is:  
> CFU/mL = (nC×dF)/Vcp

Where:

•	nc= Number of colonies counted\
•	dF = Dilution factor\
•	Vcp = Volume of the culture plated (in mL)

### **How to use**

1.	**Number of Colonies:** Enter the number of colonies counted.
2.	**Dilution Factor:** Specify the dilution factor.
3.	**Plated Volume:** Enter the volume plated on the culture.

**Outputs:** The app will compute and display the CFU/mL based on the entered data.

### **Example**
If you count 50 colonies, with a dilution factor of 10, and plate 1 mL:

**Apply formula**

> CFU/mL =  (nC×dF)/Vcp  =  (50×10)/1

The app will display: **500 CFU/mL** on the screen.

## **5. MTT Assay Cell viability Calculator**

### **Overview**
This tool calculates cell viability based on the absorbance values from MTT assays, often used to measure cellular metabolic activity.

### **Mathematical Formula**
The mathematical formula used for this calculation is:

> Cell Viability (%)=(Absorbance of Treated Cells)/(Absorbance of Control Cells)  X 100

This result is then displayed alongside a histogram that compares the absorbance values of the treated and control samples.

### **How to use**
•	**Absorbance of Treated Cells:** Input the absorbance value of the treated cells.\
•	**Absorbance of Control Cells:** Input the absorbance value of the control cells.

### **Outputs**
•	**Cell Viability (%):** The percentage of viable cells relative to the control.\
•	**Absorbance Plot:** A bar chart comparing the absorbance values of treated and control cells.

### **Example**
With treated cell absorbance of 0.65 and control absorbance of 0.85, the calculator will display a viability of 76.47%.

### **Troubleshooting and Error Handling**
•	**Invalid Inputs:** If negative or zero values are entered, an error message will prompt you to correct the inputs.\
•	**Automatic Scaling:** The plots automatically adjust based on the input data to maintain readability.

## **Hosting and Access**
Once the R Shiny dashboard is hosted, access the tool using the provided URL. For any further assistance or hosting inquiries, feel free to contact the support team.

This manual is tailored for professionals in biotechnology, pharmaceutical industries, and academic research laboratories, providing a user-friendly, efficient tool to ensure precision and reliability in laboratory calculations














