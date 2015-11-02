/*
 * Copyright (C) 2015 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.aidl.tests;

import android.aidl.tests.INamedCallback;
import android.aidl.tests.SimpleParcelable;

interface ITestService {
  // Test that primitives work as parameters and return types.
  boolean RepeatBoolean(boolean token);
  byte RepeatByte(byte token);
  char RepeatChar(char token);
  int RepeatInt(int token);
  long RepeatLong(long token);
  float RepeatFloat(float token);
  double RepeatDouble(double token);
  String RepeatString(String token);

  SimpleParcelable RepeatParcelable(in SimpleParcelable input,
                                    out SimpleParcelable repeat);

  // Test that arrays work as parameters and return types.
  boolean[] ReverseBoolean(in boolean[] input, out boolean[] repeated);
  byte[]    ReverseByte   (in byte[]    input, out byte[]    repeated);
  char[]    ReverseChar   (in char[]    input, out char[]    repeated);
  int[]     ReverseInt    (in int[]     input, out int[]     repeated);
  long[]    ReverseLong   (in long[]    input, out long[]    repeated);
  float[]   ReverseFloat  (in float[]   input, out float[]   repeated);
  double[]  ReverseDouble (in double[]  input, out double[]  repeated);
  String[]  ReverseString (in String[]  input, out String[]  repeated);

  SimpleParcelable[]  ReverseParcelables (in SimpleParcelable[]  input,
                                          out SimpleParcelable[]  repeated);

  // Test that clients can send and receive Binders.
  INamedCallback GetOtherTestService(String name);
  boolean VerifyName(INamedCallback service, String name);

  // Test that List<T> types work correctly.
  List<String> ReverseStringList(in List<String> input,
                                 out List<String> repeated);
  List<IBinder> ReverseNamedCallbackList(in List<IBinder> input,
                                         out List<IBinder> repeated);

  FileDescriptor RepeatFileDescriptor(in FileDescriptor read);
  FileDescriptor[] ReverseFileDescriptorArray(in FileDescriptor[] input,
                                              out FileDescriptor[] repeated);
}
