#ifndef BridgingHeader_h
#define BridgingHeader_h

typedef void (*OnInitCb)();
typedef void (*OnTextChangedCb)(int, const char*);
typedef void (*OnComboChangedCb)(int, int);
typedef void (*OnNumericValueChangedCb)(int, float);
typedef void (*OnBooleanValueChangedCb)(int, bool);
typedef void (*OnMultipleNumericValuesChangedCb)(int, float*, int numValues);
typedef void (*OnClickCb)(int);

void init(
    const char* assetsBasePath,
    const char* rawFontDefinitions,
    const char* rawStyleOverrideDefinitions,
    OnInitCb onInit,
    OnTextChangedCb onTextChanged,
    OnComboChangedCb onComboChanged,
    OnNumericValueChangedCb onNumericValueChanged,
    OnBooleanValueChangedCb onBooleanValueChanged,
    OnMultipleNumericValuesChangedCb onMultipleNumericValuesChanged,
    OnClickCb onClick
);

void initXFrames(
    const char* assetsBasePath,
    const char* rawFontDefinitions,
    const char* rawStyleOverrideDefinitions,
    OnInitCb onInit,
    OnTextChangedCb onTextChanged,
    OnComboChangedCb onComboChanged,
    OnNumericValueChangedCb onNumericValueChanged,
    OnBooleanValueChangedCb onBooleanValueChanged,
    OnMultipleNumericValuesChangedCb onMultipleNumericValuesChanged,
    OnClickCb onClick
) {
    init(assetsBasePath, rawFontDefinitions, rawStyleOverrideDefinitions, onInit, onTextChanged, onComboChanged, onNumericValueChanged, onBooleanValueChanged, onMultipleNumericValuesChanged, onClick);
}

#endif /* BridgingHeader_h */
