# getOs

This script was created to identify the operating system of a device.

## Explanation

When you ping a device, the response contains information about the device.  
One of the key fields is called **TTL** (Time To Live). TTL indicates how long a  
packet can exist before it expires.

### Example TTL Values
- TTL <= 64  → **Linux**
- TTL <= 128 → **Windows**
- TTL <= 254 → **Others** (e.g., IoT systems)

## Usage

```bash
getOs.sh <IP>
