### SETUP docker-compose
```bash
bash run.sh
# just copy the public ip & the hash
```

```yaml
# put the public ip after WG_HOST=90....
# put the hash without any other characters after PASSWORD_HASH=
services:
  wg-easy:
    environment:
      - PORT=51821
      - WG_PORT=51820
      - HOST=0.0.0.0
      - LANG=de
      - WG_HOST=
      - PASSWORD_HASH=$2a$12$0qy9SxQjbE4GVcdkXs2gMO69t72TGHP5KDL3Wbbk72f2Z9dsrgxoq
```


### **Crontab Entry for Auto-Starting Docker Compose on Boot**  
You need to add a cron job that runs the `docker-compose up -d` command on system startup.  

#### **Crontab Entry**
```bash
@reboot sleep 10 && cd /home/pi/dockerized-wireguard && docker compose up -d
```
This ensures that Docker Compose starts your WireGuard container **10 seconds after boot**, allowing the system to initialize properly.

---

## **Tutorial: Setting Up Auto-Start for Docker Compose on Raspberry Pi**

### **1️⃣ Open the Crontab Editor**
Run:
```bash
crontab -e
```
The first time you run this, it may ask you to select an editor. Choose **nano** (or your preferred editor).

---

### **2️⃣ Add the Crontab Entry**
Scroll to the bottom and add:
```bash
@reboot sleep 10 && cd /home/pi/dockerized-wireguard && docker compose up -d
```
Then, **save and exit**:  
- Press `CTRL + X`  
- Press `Y` (Yes)  
- Press `Enter`  

---

### **3️⃣ Verify That the Crontab Is Set**
Run:
```bash
crontab -l
```
You should see:
```
@reboot sleep 10 && cd /home/pi/dockerized-wireguard && docker compose up -d
```

---

### **4️⃣ Ensure Docker Starts on Boot**
If Docker isn't set to start automatically, enable it:
```bash
sudo systemctl enable docker
```

---

### **5️⃣ Test the Auto-Start**
Instead of restarting the Pi, test it manually:
```bash
sudo reboot
```
After rebooting, check if the container is running:
```bash
docker ps
```
If everything is working, you should see your WireGuard container running.

---

### **Optional: Log Output for Debugging**
If you want to log output from the cron job, modify the crontab entry:
```bash
@reboot sleep 10 && cd /home/pi/dockerized-wireguard && docker compose up -d >> /home/pi/wg-startup.log 2>&1
```
After rebooting, check the log:
```bash
cat /home/pi/wg-startup.log
```

---

### **🚀 Done! Your WireGuard Container Will Now Auto-Start on Boot.**  
Let me know if you run into any issues! 🚀
