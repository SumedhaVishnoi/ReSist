## 📚 Incoming Code Categories

Below are categorized descriptions for common **Incoming Test Error Codes** observed in the dataset. These are used to extract patterns during feature engineering and component prediction.

# BBOX Faults

### 🔸 BBOX Error Categories (Extended)

| **Category**            | **Incoming Code Description** |
|-------------------------|-------------------------------|
| `BBOX_25_26.16.1316`    | FAIL - ID-25,26 FID16,FID1316 |
| `BBOX1.1`               | FAIL - ID-25 BBOX FILE CHECK TEST FID16 |
| `BBOX1.1_23`            | FAIL - ID-23 BBOX FID16 |
| `BBOX1.10`             | FAIL - ID-25 BBOX FILE CHECK TEST F1D16, ID 215 ANT POWER BF 1 |
| `BBOX1.2`              | FAIL - ID-25 BBOX FILE CHECK TEST FID16, FAIL ID- NCU DETECTION MADE 3,7 |
| `BBOX1.21`             | FAIL - ID-25 BBOX FILE CHECK TEST FID16, ID-28,29 NCU DETECTION MADE 5,8 |
| `BBOX1.22`             | FAIL - ID-25 BBOX FILE CHECK TEST FID16, 28-92 NCU DETECTION MADE 7 |
| `BBOX1.221`            | FAIL - ID-25,44 BBOX FILE CHECK TEST FID16, NCU DETECTION MADE 7 |
| `BBOX1.23`             | FAIL - ID-25 BBOX FILE CHECK TEST FID16, ID-28 NCU DETECTION MADE 8 |
| `BBOX1.232`            | FAIL - ID-25 BBOX FILE CHECK TEST F1D16, ID-27 NCU DETECTION MADE 8 |
| `BBOX1.24`             | FAIL - ID-25 BBOX FILE CHECK TEST FID16, ID-27 NCU DETECTION MADE 6 |
| `BBOX1.241`            | FAIL - ID-25,28 BBOX FILE FID16 AND NCU MADE 6 |
| `BBOX1.25`             | FAIL - ID-25,27 BBOX FILE CHECK TEST FID16, NCU DETECTION MADE 2 |
| `BBOX1.26`             | FAIL - ID-25,28-30 BBOX FILE CHECK TEST FID16, NCU DETECTION MADE 1 |
| `BBOX1.3`              | FAIL - ID-25 BBOX FILE CHECK TEST FID16, ID-29 SFP FIBER LOOP BACK 25G |
| `BBOX1.4`              | FAIL - ID-25 BBOX FILE CHECK TEST FID16, ID-26 BBOX FILE CHECK TEST FID1316 |
| `BBOX1.5`              | FAIL - ID-27 BBOX FILE CHECK TEST FID1103 |
| `BBOX1.51`             | FAIL - ID-28 BBOX CHECK FILE TEST FID1103 |
| `BBOX1.6`              | FAIL - ID-26 BBOX FILE CHECK TEST FID316 |
| `BBOX1.61`             | FAIL - ID-25,26 BBOX FID16, BBOX FID316 |
| `BBOX1.7`              | FAIL - ID-26 BBOX FILE CHECK TEST FID1316 |
| `BBOX1.8`              | FAIL - ID-27-28 BBOX FID16, MADE ISSUE DETECTION 1 |
| `BBOX1.81`             | FAIL - ID-27 BBOX FILE CHECK TEST FID1103, ID-52 NCU MADE 1 |
| `BBOX1.9`              | FAIL - ID-25 BBOX FILE CHECK TEST FID16, ID-26 BBOX FILE CHECK TEST FID1316, ID-35 CONNECT MADE 2 |
| `BBOX1.91`             | FAIL - ID-25 BBOX FILE CHECK TEST F1D16, ID-27 NCU DETECTION MADE 2 |
| `BBOXDFE`              | FAIL - ID-25 BBOIX FID16, ID-142 DFE 1 |
| `BBOXFAN`              | FAIL - ID-25 BBOX FILE CHECK TEST FID16, ID-82 FAN RFSW CONTROL TEST |

> 🧩 These extended BBOX error categories involve both BBOX failures and associated NCU, DFE, SFP, and FAN module failures.  
> 🔗 Used in combo patterns like `BBOX1.9 + ModuleCode` to train and predict faulty component replacements.

> 🔹 These categories are manually derived from textual logs and grouped based on error location (BBOX), test ID, and FID (File Identifier) patterns.
> 🔹 They are used in the model as either categorical features or part of combined `combo_code` fields.
 
# NCU-Related Error Categories

These error codes correspond to **NCU Detection Failures** across various test IDs. The number after `NCU` refers to the specific NCU issue detected (e.g., 1–8), and the IDs indicate the locations or submodules where the detection was made.

| **Category**                 | **Incoming Code Description** |
|-----------------------------|-------------------------------|
| `NCU4.1`                    | FAIL - ID-25 FID16, ID-28-29 NCU DETECTION MADE 1 |
| `NCU4.1_26`                 | FAIL - ID-26 NCU DETECTION MADE 1 |
| `NCU4.1_26_27`              | FAIL - ID-26-27 NCU DETECTION MADE 1 |
| `NCU4.1_27`                 | FAIL - ID-27 NCU DETECTION MADE 1 |
| `NCU4.1_27_28`              | FAIL - ID-27-28 NCU DETECTION MADE 1 |
| `NCU4.1_28`                 | FAIL - ID-28 NCU MADE 1 |
| `NCU4.1_28_29`              | FAIL - ID-28-29 NCU DETECTION MADE 1 |
| `NCU4.2`                    | FAIL - ID-25 FID16, ID-28-29 NCU DETECTION MADE 2 |
| `NCU4.2.3.8_26_27_28`       | FAIL - ID-26,27,28 NCU DETECTION MADE 2,3,8 |
| `NCU4.2.8_27_28`            | FAIL - ID-27-28 NCU DETECTION MADE 2,8 |
| `NCU4.2.8_28_30`            | FAIL - ID-28-30 NCU DETECTION MADE 2,8 |
| `NCU4.2_26`                 | FAIL - ID-26 NCU DETECTION MADE 2 |
| `NCU4.2_27`                 | FAIL - ID-27 NCU DETECTION MADE 2 |
| `NCU4.2_27_28`              | FAIL - ID-27-28 NCU DETECTION MADE 2 |
| `NCU4.2_28`                 | FAIL - ID-28 NCU DETECTION MADE 2 |
| `NCU4.2_28_29`              | FAIL - ID-28-29 NCU DETECTION MADE 2 |
| `NCU4.3.6_45_46`            | FAIL - ID-45-46 NCU DETECTION MADE 6 |
| `NCU4.3.7.8_27_30`          | FAIL - ID-27-30 NCU DETECTION MADE 3,7,8 |
| `NCU4.3.7_44_45`            | FAIL - ID-44-45 NCU DETECTION MADE 3,7 |
| `NCU4.3_27`                 | FAIL - ID-27 NCU DETECTION MADE 3 |
| `NCU4.3_27_28`              | FAIL - ID-27-28 NCU DETECTION MADE 3 |
| `NCU4.3_28`                 | FAIL - ID-28 NCU DETECTION MADE 3 |
| `NCU4.3_28_29`              | FAIL - ID-28-29 NCU DETECTION MADE 3 |
| `NCU4.4`                    | FAIL - ID-25 FID16, ID-28-30 NCU DETECTION MADE 4 |
| `NCU4.4.5_27_30`            | FAIL - ID-27-30 NCU DETECTION MADE 4,5 |
| `NCU4.4.6_27_28`            | FAIL - ID-27,28 NCU DETECTION MADE 4,6 |
| `NCU4.4.8_28_30`            | FAIL - ID-28-30 NCU MADE 4,8 |
| `NCU4.4_26`                 | FAIL - ID-26 NCU DETECTION MADE 4 |
| `NCU4.4_27`                 | FAIL - ID-27 NCU DETECTION MADE 4 |
| `NCU4.4_28`                 | FAIL - ID-28 NCU DETECTION MADE 4 |
| `NCU4.5.6_28_29`            | FAIL - ID-28-29 NCU DETECTION MADE 5,6 |
| `NCU4.5_26_27`              | FAIL - ID-26,27 NCU DETECTION MADE 5 |
| `NCU4.5_27`                 | FAIL - ID-27 NCU DETECTION MADE 5 |
| `NCU4.5_28_29`              | FAIL - ID-28-29 NCU DETECTION MADE 5 |
| `NCU4.5_29`                 | FAIL - ID-2-29 NCU DETECTION MADE 5 |
| `NCU4.6`                    | FAIL - ID-25 FID16, ID-28-29 NCU DETECTION MADE 6 |
| `NCU4.6_26`                 | FAIL - ID-26 NCU DETECTION MADE 6 |
| `NCU4.6_26_152`             | FAIL - ID-26-152 NCU DETECTION MADE 6 |
| `NCU4.6_27`                 | FAIL - ID-27 NCU DETECTION MADE 6 |
| `NCU4.6_27_28`              | FAIL - ID-27-28 NCU DETECTION MADE 6 |
| `NCU4.6_27_30`              | FAIL - ID-27-30 NCU DETECTION MADE 6 |
| `NCU4.6_28`                 | FAIL - ID-28 NCU DETECTION MADE 6 |
| `NCU4.7.8_27_28`            | FAIL - ID-27 NCU DETECTION MADE 7, ID-28 NCU DETECTION MADE 8 |
| `NCU4.7_26`                 | FAIL - ID-26 NCU DETECTION MADE 7 |
| `NCU4.7_27`                 | FAIL - ID-27 NCU DETECTION MADE 7 |
| `NCU4.7_28`                 | FAIL - ID-28 NCU DETECTION MADE 7 |
| `NCU4.8`                    | FAIL - ID-25 FID16, ID-28,29 NCU DETECTION MADE 8 |
| `NCU4.8_26`                 | FAIL - ID-26 NCU DETECTION MADE 8 |
| `NCU4.8_27`                 | FAIL - ID-27 NCU DETECTION MADE 8 |
| `NCU4.8_27_28`              | FAIL - ID-27,28 NCU MADE 8, NCU ISSUE DETECTION |
| `NCU4.8_28_29`              | FAIL - ID-28-29 NCU DETECTION MADE 8 |

> 🛠️ These categories are used to feed the machine learning model with high-level semantic groupings of similar test outcomes.  
> 🔄 Each label indicates a unique combination of error signatures based on test station logs.


 **Category** | **Incoming Code Description** |
|--------------|-------------------------------|
| `MADE2.4` | FAIL - ID-100 CONNECT MADE 7_M32 |
| `6.1` | FAIL - ID-116 BIST MADE 2 ANT TEST BINARY MADE 5, ID-142-147 DFE1-5_M32 |
| `6_read_121` | FAIL - ID-121 READ MADE EYE HEIGHT 2 LANE 1_M32 |
| `6_read_124` | FAIL - ID-124 READ MADE EYE_M32 |
| `5_17,18,19,20` | FAIL - ID-17 POWER RESET TEST, ID-18 UART TEST, ID-19PING TARGET, ID-20 CONNECT MASTER CPU_M32 |
| `5_Power_17` | FAIL - ID-17 POWER RESET TEST_M32 |
| `5_Power_17` | FAIL - ID-17 POWER RESTE TEST_M32 |
| `5.1_17-20` | FAIL - ID-17-20 POWER RESET TEST_M32 |
| `5.2` | FAIL - ID-18 PING TARGET_M32 |
| `5.3` | FAIL - ID-18 UART TEST, ID-19 PING TARGET, ID-20 CONNECT MASTER CPU_M32 |
| `5.4` | FAIL - ID-18 UART TEST_M32 |
| `5.5` | FAIL - ID-18,19 PING TARGET_M32 |
| `5.6` | FAIL - ID-18-20 PING TARGET, CONNECT MASTER CPU_M32 |
| `5.6` | FAIL - ID-18-20 PING TARGET_M32 |
| `5.6` | FAIL - ID-18-20 UART TEST, PING TARGET_M32 |
| `5.6` | FAIL - ID-18-20 UART TEST_M32 |
| `5.6` | FAIL - ID-18-20 UART, PING TARGET_M32 |
| `5.6` | FAIL - ID-18-20 UART, PING, CONNECT MASTER CPU_M32 |
| `5.7` | FAIL - ID-19 PING TARGET, CONNECT MASTER CPU_M32 |
| `5.7` | FAIL - ID-19 PING TARGET, ID-20 CONNECT MASTER CPU_M32 |
| `5.8.1` | FAIL - ID-19,20 PING TARGET, CONTROL MASTER CPU_M32 |
| `5.8.2` | FAIL - ID-19,20 PING TEST AND CONNECT MASTER CPU_M32 |
| `5.9` | FAIL - ID-20 CONNECT MASTER CPU_M32 |
| `exc` | FAIL - ID-20 SANITY HWS_M32 |
| `6_ANT_200` | FAIL - ID-200 ANT POWER BF 1, TRX 5_M32 |
| `6_ANT_207` | FAIL - ID-207 ANT POWER BF 1 MADE 2_M32 |
| `exc ` | FAIL - ID-26 CONNECT MASTER CPU_M32 |
| `SFP_fiber_1` | FAIL - ID-260 SFP FIBER LOOP BACK_M32 |
| `fiberloop_2` | FAIL - ID-270 SFP 2 FIBER LOOP BACK 25G_M32 |
| `fiberloop_3` | FAIL - ID-273 SFP 3 FIBER LOOP BACK 25G_M32 |
| `fiberloop_3` | FAIL - ID-273 SFP3 FIBER LOOP BACK 25G_M32 |
| `MADE 2.1` | FAIL - ID-35 CONNECT MADE 1_M32 |
| `FAN_control_1` | FAIL - ID-80-81 FAN FULL CONTROL TEST_M32 |
| `FAN_control_2` | FAIL - ID-82 FAN RFSW CONTROL TEST, ID-86 FAN FULL CONTROL TEST_M32 |
| `FAN_control_3` | FAIL - ID-83085 FAN FULL CONTROL TEST_M04 |
| `FAN_control_1_86` | FAIL - ID-86 FAN FULL CONTROL TEST_M32 |
| `exc` | FAIL - ID-88,89 FAN FULL CONTROL TEST CONNECT MADE 6TRX _PA ASSEMBLY FAULTY REPAIRED_M32 |
| `MADE 2.2` | FAIL - ID-94,95 CONNECT MADE 3,6_M32 |
| `MADE2.3` | FAIL - ID-98-100 CONNECT MADE 3,8,2_M32 |
| `MADE 2.3` | FAIL - ID-98-100 CONNECT MADE 3,8,2_M32 |
| `MADE 2.5` | FAIL - ID-99 CONNECT MADE 8_M32 |


| CATEGORY | Failure IDs            | Test Type(s)                                                                                            |
|-------|------------------------|---------------------------------------------------------------------------|
| 3.1   | ID-171                 | BF SELF CAL TEST TX                                                       |                                        |
| 3.2   | ID-25,171,173,174      | BF SELF CAL TEST, TRX_PA ASSEMBLY FAULTY REPAIRED                         |                                        |
| 3.3   | ID-170                 | BF SELF CAL TEST                                                          |                                        |
| 3.4   | ID-190                 | BF SELF CAL TEST TX                                                       |                                        |
| 3.6   | ID-26,182              | BBOX FILE CHECK TEST FID1316, BF SELF CAL TEST TX                         |                                        |
| 3.7   | ID-25,168-174          | BBOX FID16, ARRAY CARRIER SETUP, BF SELF CAL TEST                         |                                        |
| 3.8   | ID-170,173,232-263     | BF SELF CAL CAL TEST, ANT POWER BF 2                                      |                                        |
| 3.9   | ID-169                 | BF SELF CAL TEST TX                                                       |                                        |
| 3.11  | ID-169-173             | BF SELF CAL TEST, DEALTIVE ARRAY CARRIER                                  |                                        |
| 3.12  | ID-168-174             | BF SELF CAL TEST, ARRAY CARRIER SETUP                                     |                                        |
| 3.13  | ID-170,187             | BF SELF CAL TEST, READ MONITOR POWER, TRX_PA ASSEMBLY FAULTY REPAIRED     |                                        |
| 3.14  | ID-169,171-172         | BF SELF CAL TEST                                                          |                                        |
| 3.15  | ID-170,187             | BF SELF CAL TEST, READ MONITOR POWER, TRX_PA ASSEMBLY FAULTY REPAIRED     |                                        |
| 7.3   | ID-24                  | SANITY CHECK HWS                                                          |                                        |
| 7.2   | ID-24                  | SANITY CHECK                                                              |                                        |

