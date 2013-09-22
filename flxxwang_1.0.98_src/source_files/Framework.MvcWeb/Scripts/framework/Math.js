//缓动函数开始
Math.linearTween = function (t, b, c, d) {
    return c * t / d + b;
};
//线性运动函数
Math.easeInQuad = function (t, b, c, d) {
    return c * (t /= d) * t + b;
};
//二次缓入函数
Math.easeOutQuad = function (t, b, c, d) {
    return -c * (t /= d) * (t - 2) + b;
};
//二次缓出函数
Math.easeINOutQuad = function (t, b, c, d) {
    if ((t /= d / 2) < 1) {
        return c / 2 * t * t + b;
    }
    return -c / 2 * ((--t) * (t - 2) - 1) + b;
};
//二次缓入缓出函数
Math.easeInCubic = function (t, b, c, d) {
    return c * Math.pow(t / d, 3) + b;
};
//三次缓入函数
Math.easeOutCubic = function (t, b, c, d) {
    return c * (Math.pow(t / d - 1, 3) + 1) + b;
};
//三次缓出函数
Math.easeINOutCubic = function (t, b, c, d) {
    if ((t /= d / 2) < 1) {
        return c / 2 * Math.pow(t, 3) + b;
    }
    return c / 2 * (Math.pow(t - 2, 3) + 2) + b;
};
//三次缓入缓出函数
Math.easeInQuart = function (t, b, c, d) {
    return c * Math.pow(t / d, 4) + b;
};
//四次缓入函数
Math.easeOutQuart = function (t, b, c, d) {
    return -c * (Math.pow(t / d - 1, 4) - 1) + b;
};
//四次缓出函数
Math.easeINOutQuart = function (t, b, c, d) {
    if ((t /= d / 2) < 1) {
        return c / 2 * Math.pow(t, 4) + b;
    }
    return -c / 2 * (Math.pow(t - 2, 4) - 2) + b;
};
//四次缓入缓出函数
Math.easeInQuint = function (t, b, c, d) {
    return c * Math.pow(t / d, 5) + b;
};
//五次缓入函数
Math.easeOutQuint = function (t, b, c, d) {
    return c * (Math.pow(t / d - 1, 5) + 1) + b;
};
//五次缓出函数
Math.easeINOutQuint = function (t, b, c, d) {
    if ((t /= d / 2) < 1) {
        return c / 2 * Math.pow(t, 5) + b;
    }
    return c / 2 * (Math.pow(t - 2, 5) + 2) + b;
};
//五次缓入缓出函数
Math.easeInSine = function (t, b, c, d) {
    return c * (1 - Math.cos(t / d * (Math.PI / 2))) + b;
};
//正弦缓出函数
Math.easeOutSine = function (t, b, c, d) {
    return c * Math.sin(t / d * (Math.PI / 2)) + b;
};
//正弦缓出函数
Math.easeINOutSine = function (t, b, c, d) {
    return c / 2 * (1 - Math.cos(Math.PI * t / d)) + b;
};
//正弦缓入缓出函数
Math.easeInExpo = function (t, b, c, d) {
    return c * Math.pow(2, 10 * (t / d - 1)) + b;
};
//指数缓入函数
Math.easeOutExpo = function (t, b, c, d) {
    return c * (-Math.pow(2, -10 * t / d) + 1) + b;
};
//指数缓出函数
Math.easeINOutExpo = function (t, b, c, d) {
    if ((t /= d / 2) < 1) {
        return c / 2 * Math.pow(2, 10 * (t - 1)) + b;
    }
    return c / 2 * (-Math.pow(2, -10 * --t) + 2) + b;
};
//指数缓入缓出函数
Math.easeInCirc = function (t, b, c, d) {
    return c * (1 - Math.sqrt(1 - (t /= d) * t)) + b;
};
//圆形缓入函数
Math.easeOutCirc = function (t, b, c, d) {
    return c * Math.sqrt(1 - (t = t / d - 1) * t) + b;
};
//圆形缓出函数
Math.easeINOutCirc = function (t, b, c, d) {
    if ((t /= d / 2) < 1) {
        return c / 2 * (1 - Math.sqrt(1 - t * t)) + b;
    }
    return c / 2 * (Math.sqrt(1 - (t -= 2) * t) + 1) + b;
};
//圆形缓入缓出函数
//缓动函数结束