# getOs

This script was created to identify the operating system of a device.

Let me explain:

When you ping a Device, the response contains information about the device.
One of the key fields is called TTL (Time To Live). TTL indicates how long a
packet can exist before it expires.

For example:
TTL <=64  = Linux.
TTL <=128 = Windows.
TTL <=254 = Others (Like a IoT System).
