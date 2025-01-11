// import BridgingHeader
import Foundation

typealias OnInitCb = @convention(c) () -> Void
typealias OnTextChangedCb = @convention(c) (Int32, UnsafePointer<CChar>) -> Void
typealias OnComboChangedCb = @convention(c) (Int32, Int32) -> Void
typealias OnNumericValueChangedCb = @convention(c) (Int32, Float) -> Void
typealias OnBooleanValueChangedCb = @convention(c) (Int32, Bool) -> Void
typealias OnMultipleNumericValuesChangedCb = @convention(c) (Int32, UnsafeMutablePointer<Float>, Int32) -> Void
typealias OnClickCb = @convention(c) (Int32) -> Void

// func initializeLibrary(
//     assetsBasePath: UnsafePointer<CChar>,
//     rawFontDefinitions: UnsafePointer<CChar>,
//     rawStyleOverrideDefinitions: UnsafePointer<CChar>,
//     onInit: @escaping OnInitCb,
//     onTextChanged: @escaping OnTextChangedCb,
//     onComboChanged: @escaping OnComboChangedCb,
//     onNumericValueChanged: @escaping OnNumericValueChangedCb,
//     onBooleanValueChanged: @escaping OnBooleanValueChangedCb,
//     onMultipleNumericValuesChanged: @escaping OnMultipleNumericValuesChangedCb,
//     onClick: @escaping OnClickCb
// ) {
    
// }

@_extern(c, "init")
func initt(assetsBasePath: UnsafePointer<CChar>,
    rawFontDefinitions: UnsafePointer<CChar>,
    rawStyleOverrideDefinitions: UnsafePointer<CChar>,
    onInit: @escaping OnInitCb,
    onTextChanged: @escaping OnTextChangedCb,
    onComboChanged: @escaping OnComboChangedCb,
    onNumericValueChanged: @escaping OnNumericValueChangedCb,
    onBooleanValueChanged: @escaping OnBooleanValueChangedCb,
    onMultipleNumericValuesChanged: @escaping OnMultipleNumericValuesChangedCb,
    onClick: @escaping OnClickCb)

func onInit() {
    print("Initialization complete!")
}

func onTextChanged(id: Int32, text: UnsafePointer<CChar>) {
    let textStr = String(cString: text)
    print("Text changed for id \(id): \(textStr)")
}

func onComboChanged(id: Int32, value: Int32) {
    print("Combo changed for id \(id), value: \(value)")
}

func onNumericValueChanged(id: Int32, value: Float) {
    print("Numeric value changed for id \(id): \(value)")
}

func onBooleanValueChanged(id: Int32, value: Bool) {
    print("Boolean value changed for id \(id): \(value)")
}

func onMultipleNumericValuesChanged(id: Int32, values: UnsafeMutablePointer<Float>, numValues: Int32) {
    let valuesArray = Array(UnsafeBufferPointer(start: values, count: Int(numValues)))
    print("Multiple numeric values changed for id \(id): \(valuesArray)")
}

func onClick(id: Int32) {
    print("Click event for id \(id)")
}

func main() {
    let assetsBasePath = "./assets".cString(using: .utf8)!
    let fontDefs = "{}".cString(using: .utf8)!
    let styleDefs = "{}".cString(using: .utf8)!

    // Call the init function with callbacks
    initt(
        assetsBasePath: assetsBasePath,
        rawFontDefinitions: fontDefs,
        rawStyleOverrideDefinitions:styleDefs,
        onInit: onInit,
        onTextChanged: onTextChanged,
        onComboChanged: onComboChanged,
        onNumericValueChanged: onNumericValueChanged,
        onBooleanValueChanged: onBooleanValueChanged,
        onMultipleNumericValuesChanged: onMultipleNumericValuesChanged,
        onClick: onClick
    )

    print("Press Enter to continue...")

    // Wait for the user to hit Enter (no input expected)
    _ = readLine()
}

main();
