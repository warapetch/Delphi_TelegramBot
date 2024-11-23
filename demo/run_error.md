# รันไม่ผ่าน !!

## เนื่องจากผมใช้ เดลไฟ 12
ผู้ที่ติดปัญหา รันไม่ผ่าน ติด 2 จุด คือ
```
1. ในไฟล์ของคอมโพเนนท์ อ้างถึง CustHeader ไม่มี !!
แนวทางการแก้ไขปัญหา
คือ ใส่ // เพื่อคอมเมนท์  (หรือจะใช้ TNetHeaders) เลือกอย่างใด อย่างหนึ่ง
```

![image](https://github.com/user-attachments/assets/a4b7a5f1-a0cd-4d9a-a4ef-ca7624510220)


```
2. ในโค้ดตัวอย่าง
เดลไฟต่ำกว่า เดลไฟ 12
TJsonArray  ไม่สามารถอ้างถึง [Index] ได้
แนวทางการแก้ไขปัญหา
jsonUpdate := jsonArr.Items[i];
```


![image](https://github.com/user-attachments/assets/3cf0289b-14f1-484d-87aa-0a4f535f2110)
