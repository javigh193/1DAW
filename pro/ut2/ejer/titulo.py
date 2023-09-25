full_name = input("¿Su nombre? ")
while full_name.istitle() == False:  # not full_name.istitle()...
    print("Error, debe escribirlo correctamente.")
    full_name = input("¿Su nombre? ")
print("Nombre correcto.")

# while True:
#   full_name = input("¿Su nombre? ")
#   if full_name.istitle():
#       print("Nombre correcto.")
#       break
#   print("Error, debe escribirlo correctamente.")
#
# while not (full_name := input('Nombre: ')).istitle():
#   print('Error')
