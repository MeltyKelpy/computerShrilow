greasepuppies = 0
money_spent = 0
desired_amount = int(input("how many greasepuppies u want bro "))

for i in range(desired_amount):
    multi = greasepuppies - 4
    if multi < 0:
        multi = 0
    money_spent += 75 + ((75 * 0.1) * multi)
    greasepuppies += 1
print(f"The Money Required for {greasepuppies} is {money_spent}")