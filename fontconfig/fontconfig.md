# Fontconfig 参数详细文档

## 基本结构

Fontconfig 是一个用于配置和自定义字体渲染的库，其配置文件使用 XML 格式。典型的配置文件结构如下：

```xml
<fontconfig>
    <!-- 配置内容 -->
</fontconfig>
```

## 常用元素

### 目录配置

```xml
<dir>/路径/到/字体/目录</dir>
```
指定系统查找字体的目录，可以使用绝对路径或相对路径。

### 匹配规则

```xml
<match target="pattern|font">
    <test name="属性名" compare="比较方式">
        <string>值</string>
    </test>
    <edit name="属性名" mode="编辑模式" binding="绑定方式">
        <string>值</string>
    </edit>
</match>
```

## 匹配目标 (target)

- `pattern`: 匹配字体选择模式（最常用）
- `font`: 匹配实际字体
- `scan`: 匹配字体扫描过程

## 测试属性 (test)

常用属性名：
- `family`: 字体族名
- `lang`: 语言
- `style`: 样式
- `weight`: 字重
- `slant`: 倾斜度

比较方式 (compare)：
- `eq`: 等于
- `contains`: 包含
- `not_eq`: 不等于
- `less`: 小于
- `less_eq`: 小于等于
- `more`: 大于
- `more_eq`: 大于等于

## 编辑属性 (edit)

编辑模式 (mode)：
- `assign`: 完全替换原有值
- `prepend`: 添加到列表开头（优先级高）
- `append`: 添加到列表末尾（优先级低）
- `delete`: 删除匹配的值

绑定方式 (binding)：
- `strong`: 强绑定，覆盖其他配置
- `weak`: 弱绑定，可被其他配置覆盖
- `same`: 保持与测试属性相同的绑定强度

## 字体族分类

- `serif`: 衬线字体
- `sans-serif`: 无衬线字体
- `monospace`: 等宽字体
- `emoji`: 表情符号字体

## 常用配置示例

### 设置默认衬线字体
```xml
<match target="pattern">
    <test name="family" compare="eq">
        <string>serif</string>
    </test>
    <edit name="family" mode="prepend" binding="same">
        <string>Times New Roman</string>
        <string>其他衬线字体</string>
    </edit>
</match>
```

### 为特定语言设置字体
```xml
<match target="pattern">
    <test name="lang" compare="contains">
        <string>zh</string>
    </test>
    <edit name="family" mode="prepend" binding="strong">
        <string>中文字体</string>
    </edit>
</match>
```

### 禁用特定字体
```xml
<selectfont>
    <rejectfont>
        <pattern>
            <patelt name="family">
                <string>不想使用的字体</string>
            </patelt>
        </pattern>
    </rejectfont>
</selectfont>
```

### 字体替换
```xml
<match target="pattern">
    <test name="family" compare="eq">
        <string>要替换的字体</string>
    </test>
    <edit name="family" mode="assign" binding="same">
        <string>替换后的字体</string>
    </edit>
</match>
```

## 高级配置

### 抗锯齿设置
```xml
<match target="font">
    <edit name="antialias" mode="assign">
        <bool>true</bool>
    </edit>
</match>
```

### 微调设置
```xml
<match target="font">
    <edit name="hinting" mode="assign">
        <bool>true</bool>
    </edit>
    <edit name="hintstyle" mode="assign">
        <const>hintslight</const>  <!-- 可选值: hintnone, hintslight, hintmedium, hintfull -->
    </edit>
</match>
```

### LCD滤镜 (子像素渲染)
```xml
<match target="font">
    <edit name="rgba" mode="assign">
        <const>rgb</const>  <!-- 可选值: rgb, bgr, vrgb, vbgr, none -->
    </edit>
    <edit name="lcdfilter" mode="assign">
        <const>default</const>  <!-- 可选值: none, default, light, legacy -->
    </edit>
</match>
```
```

## 绑定方式详解

关于你特别询问的 `binding="same"` 参数：

1. **binding="same"**：使替换字体与原始请求保持相同的绑定强度。这意味着如果原始模式是强绑定的，替换也是强绑定的；如果原始模式是弱绑定的，替换也是弱绑定的。这是最常用的设置，可以保持一致的字体替换逻辑。

2. **binding="strong"**：表示这个替换规则优先级很高，会覆盖其他配置。通常用于你非常确定要使用某种字体的情况，比如为特定语言指定专用字体。

3. **binding="weak"**：表示这个替换规则优先级较低，容易被其他规则覆盖。通常用于提供后备字体选项。

在你的配置中，对一般字体族使用 `binding="same"` 是合适的，而对中文字体使用 `binding="strong"` 也是合理的，因为你希望中文内容一定使用指定的中文字体。
