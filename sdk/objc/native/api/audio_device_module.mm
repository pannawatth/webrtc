/*
 *  Copyright 2018 The WebRTC project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */

#include "audio_device_module.h"

#include "rtc_base/logging.h"
#include "rtc_base/ref_counted_object.h"

#if defined(WEBRTC_IOS)
#include "sdk/objc/native/src/audio/audio_device_module_ios.h"
#endif

#include "modules/audio_device/include/audio_device.h"

namespace webrtc {

rtc::scoped_refptr<AudioDeviceModule> CreateAudioDeviceModule(bool bypass_voice_processing) {
  RTC_DLOG(LS_INFO) << __FUNCTION__;
#if defined(WEBRTC_IOS)
  return new rtc::RefCountedObject<ios_adm::AudioDeviceModuleIOS>(bypass_voice_processing);
#else
  RTC_LOG(LS_ERROR) << "current platform is not supported => this module will self destruct!";
  return nullptr;
#endif
}
}
