How do you measure up?
========================================================
author: Jerry R. Nedelman
date: February, 2015

Introduction to the app
========================================================

Given your height, weight, and sex, this app will calculate
3 other measures of your body size.

- Body Mass Index (BMI)
- Body Surface Area (BSA)
- Lean Body Mass (LBM)

For each of height and weight, select the units you prefer to use,
and then enter the values of your height and weight in those units.

Then select your sex.

Then hit "Submit".

(These calculations are valid only for adults.)

Body Mass Index
========================================================
BMI is  $W / (H/100)^2$, with W = Weight in kg and H = Height in cm.

For example, a 70 kg person who is 175 cm tall will have a BMI of 

```
22.86 kg/m^2
```

BMI is often used as an indicator of whether a person is overweight, 
underweight, or of normal weight for their height. This app translates the
calculated BMI into such an assessment using categories determined by 
the World Health Organization 
<small>(en.wikipedia.org/wiki/Body_mass_index)</small>.

Body Surface Area
========================================================
BSA is used to determine the doses of many drugs, especially
cancer drugs. For example, the dose of docetaxel for locally advanced or metastatic breast cancer is 60-100 milligrams per square meter of BSA.
<small>(http://www.accessdata.fda.gov/drugsatfda_docs/label/2012/201525s002lbl.pdf)</small>


There are several prediction equations for BSA. This app uses the Du Bois
formula <small>(http://en.wikipedia.org/wiki/Body_surface_area)</small>:

$BSA = 0.007184(W^{0.425})(H^{0.725})$

with W = Weight in kg and H = Height in cm. For example, a 70 kg person who is 175 cm tall will have a BSA of 

```
1.848 m^2
```
Lean Body Mass
========================================================
LBM is what you get when you subtract the weight of body fat from the total
body weight. Some scientists believe that LBM is better than BSA for determining
drug doses (e.g., <small>http://www.ncbi.nlm.nih.gov/pubmed/8013162</small>).

This app uses Hume's formula for LBM  
(<small>http://en.wikipedia.org/wiki/Lean_body_mass</small>):

$LBM = 0.32810*W + 0.33929*H - 29.5336$ (men),
$LBM = 0.29569*W + 0.41813*H - 43.2933$ (women),  

with W = Weight in kg and H = Height in cm. For example, the LBM of a man 
who weighs 70 kg and is 175 cm tall is 

```
52.81 kg
```
