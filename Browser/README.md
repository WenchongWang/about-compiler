

# 浏览器底层原理, W3C规范及API

## 深入浏览器机制 

![](chromium.jpg)

*参考资料*

- [Chromium Design Documents](https://github.com/chromium/chromium/tree/master/docs)
- [Chromium中文文档](https://www.bookstack.cn/books/Chromium_doc_zh) 及 [github](https://github.com/ahangchen/Chromium_doc_zh)
- [理解WebKit和Chromium](https://blog.csdn.net/milado_nju/article/details/7216067)
- [图解浏览器的工作原理](https://www.infoq.cn/article/CS9-WZQlNR5h05HHDo1b)
- [Web 性能](https://developer.mozilla.org/zh-CN/docs/Web/Performance) 及 [渲染页面：浏览器的工作原理](https://developer.mozilla.org/zh-CN/docs/Web/Performance/How_browsers_work)
- [Inside look at modern web browser](https://developers.google.cn/web/updates/2018/09/inside-browser-part1)
- [修改Chromium源码，实现HEVC/H.265 4K视频播放](https://cloud.tencent.com/developer/news/474133)
- [如何在浏览器中支持H265/HEVC](https://blog.csdn.net/yanrx76/article/details/116238315)
- [让CEF支持HEVC(H.265)视频播放](https://blog.csdn.net/epubcn/article/details/103251688)
- [henrypp/chromium](https://github.com/henrypp/chromium)
- [epubcn/cef_enhancement](https://github.com/epubcn/cef_enhancement)
- [浏览器支持H.265解码总结](https://www.cnblogs.com/lidabo/p/14763192.html)

## WebRTC实时通信

## WebAssembly汇编

​	详见: [WASM学习](../Wasm/README.md)

## WebGPU计算与渲染

1. WebGL vs WebGPU

    ![](WebGLVsWebGPU.png)

    1. 深入WebGPU
    2. 深入Vulkan, 详见: [about-os/Linux图形子系统](https://gitee.com/yejinlei/about-os/blob/master/humaninterface/hi/graphics/Linux%E5%9B%BE%E5%BD%A2%E5%AD%90%E7%B3%BB%E7%BB%9F.md)
    3. FrameBuffer, 详见: [about-os/Linux图形子系统](https://gitee.com/yejinlei/about-os/blob/master/humaninterface/hi/graphics/Linux%E5%9B%BE%E5%BD%A2%E5%AD%90%E7%B3%BB%E7%BB%9F.md)

2. 下载Edge浏览器, /opt/microsoft/msedge-dev/msedge --enable-unsafe-webgpu --enable-features=Vulkan,UseSkiaRenderer

    ```sh
    https://www.microsoftedgeinsider.com/zh-cn/download #PC版
    https://www.microsoftedgeinsider.com/zh-cn/download?platform=android #安卓版
    ```

    

3. Intel GPU工具

    ```sh
    sudo apt-get install intel-gpu-tools
    sudo intel_gpu_top #查看GPU使用情况
    ```

*参考资料*

- [about-os - Linux图形子系统](https://gitee.com/yejinlei/about-os/blob/master/humaninterface/hi/graphics/Linux%E5%9B%BE%E5%BD%A2%E5%AD%90%E7%B3%BB%E7%BB%9F.md)
- [WebGPU Github官网](https://github.com/gpuweb/gpuweb)
- [WebGPU开发进度](https://github.com/gpuweb/gpuweb/wiki/Implementation-Status)
- [WebGPU Editor’s Draft, 18 August 2021](https://gpuweb.github.io/gpuweb/)
- [WebGL Overview](https://www.khronos.org/webgl/)
- [WebGPU Explainer Living Standard, 18 August 2021](https://gpuweb.github.io/gpuweb/explainer/)
- [WebGPU Samples](http://austin-eng.com/webgpu-samples)
- [WebGPU 技术进展及社区组状态更新](https://www.w3.org/2018/11/17-chinese-web-gpu.pdf)
- [From 0 to glTF with WebGPU: The First Triangle](https://www.willusher.io/graphics/2020/06/15/0-to-gltf-triangle)

---

- [WebGL 2.0 Compute 已废弃](https://www.khronos.org/registry/webgl/specs/latest/2.0-compute/)
- [WebGL Samples](https://webglsamples.org/)

---

- GPU.js, https://gpu.rocks
- [使用GPU.js让你的Angular.js程序提速10倍](https://juejin.cn/post/6965657517376569380)

---

- [html dom和canvas 2d和webgl的性能对比](https://zhuanlan.zhihu.com/p/350323062), 打开观察CPU和Intel GPU使用情况
  - dom: https://wow.techbrood.com/uploads/2101/perf_test/dom.html
  - canvas (2d): https://wow.techbrood.com/uploads/2101/perf_test/canvas.html
  - webgl: https://wow.techbrood.com/uploads/2101/perf_test/webgl.html
- [GPU加速在前端的应用](https://juejin.cn/post/6965810210283716644)

## WebXR虚拟/增强/混合现实

*参考资料*

- [WebXR API Emulator by Mozilla Mixed Reality](https://addons.mozilla.org/en-US/firefox/user/15240799/)
- [WebXR 设备 接口参考](https://developer.mozilla.org/zh-CN/docs/Web/API/WebXR_Device_API)
- [Fundamentals of WebXR](https://developer.mozilla.org/en-US/docs/Web/API/WebXR_Device_API/Fundamentals)
- [WebXR Device API W3C Working Draft, 24 July 2020](https://www.w3.org/TR/webxr/)
- [hello-webxr demo](https://mixedreality.mozilla.org/hello-webxr/)
- [webxr samples](https://immersive-web.github.io/webxr-samples/)
- [WebXR Overview](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/javascript/webxr-overview)
- [firefox reality](https://mixedreality.mozilla.org/firefox-reality/)
- [webvr samples](https://webvr.info/samples/)
- [aframe examples](https://aframe.io/examples/showcase/modelviewer/)
- [高盛VR与AR报告：下一个通用计算平台](https://tech.qq.com/a/20160202/011274.htm)