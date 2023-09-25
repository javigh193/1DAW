class MobilePhone:
    def __init__(
        self,
        manufacturer: str,
        screen_size: float,
        num_cores: int,
        apps: list[str] = [],
        discharge_rate: int = 1,
    ):
        self.manufacturer = manufacturer
        self.screen_size = screen_size
        self.num_cores = num_cores
        self.apps = apps
        self.discharge_rate = discharge_rate
        self.battery = 0
        self.status = False

    def check_battery(method):
        def wrapper(self, *args, **kwargs):
            if self.battery == 0:
                print("No Battery, charge_battery() required")
                return False
            method(self, *args, **kwargs)
            self.battery = max(0, self.battery - self.discharge_rate)
            if self.battery == 0:
                print("Battery has run out, switching off")
                self.status = False
                return False
            return True

        return wrapper

    def check_satus(method):
        def wrapper(self, *args, **kwargs):
            if self.status:
                return method(self, *args, **kwargs)
            print("The mobile phone is off, power_switch() required")

        return wrapper

    def charge_battery(self, amount):
        self.battery = min(100, self.battery + amount)

    @check_battery
    def power_switch(self):
        self.status = not self.status

    @check_satus
    @check_battery
    def install_app(self, *apps):
        if apps[0] not in self.apps:
            self.apps.append(apps[0])
        if len(apps) > 1:
            return self.install_app(apps[1:])

    @check_satus
    @check_battery
    def uninstall_app(self, *apps):
        if apps[0] in self.apps:
            self.apps.remove(apps[0])
        if len(apps) > 1:
            return self.uninstall_app(apps[1:])

    def print_info(self):
        print(
            f"*\nDatos del teléfono\n\
            Fabricante: {self.manufacturer}\n\
            Pantalla: {self.screen_size}\n\
            Nucleos: {self.num_cores}\n\
            Discharge rate: {self.discharge_rate}\n\
            Aplicaciones: {self.apps}\n\
            Estado: {self.status}\n\
            Batería: {self.battery}\n*"
        )


iphone20 = MobilePhone("iphone", 20.4, 4, ["angry_birds", "spotify"], discharge_rate=5)
iphone20.charge_battery(100)
iphone20.print_info()
iphone20.power_switch()
iphone20.print_info()
iphone20.uninstall_app("angry_birds", "spotify")
iphone20.install_app("marca", "bbva", "facebook")
iphone20.print_info()
iphone20.power_switch()
iphone20.print_info()
