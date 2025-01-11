import Foundation

enum ImGuiCol: Int {
    case text = 0
    case textDisabled
    case windowBg
    case childBg
    case popupBg
    case border
    case borderShadow
    case frameBg
    case frameBgHovered
    case frameBgActive
    case titleBg
    case titleBgActive
    case titleBgCollapsed
    case menuBarBg
    case scrollbarBg
    case scrollbarGrab
    case scrollbarGrabHovered
    case scrollbarGrabActive
    case checkMark
    case sliderGrab
    case sliderGrabActive
    case button
    case buttonHovered
    case buttonActive
    case header
    case headerHovered
    case headerActive
    case separator
    case separatorHovered
    case separatorActive
    case resizeGrip
    case resizeGripHovered
    case resizeGripActive
    case tab
    case tabHovered
    case tabActive
    case tabUnfocused
    case tabUnfocusedActive
    case plotLines
    case plotLinesHovered
    case plotHistogram
    case plotHistogramHovered
    case tableHeaderBg
    case tableBorderStrong
    case tableBorderLight
    case tableRowBg
    case tableRowBgAlt
    case textSelectedBg
    case dragDropTarget
    case navHighlight
    case navWindowingHighlight
    case navWindowingDimBg
    case modalWindowDimBg
    case count
}

struct HEXA: Codable {
    let color: String
    let opacity: Float
    
    // Custom init to convert to an array
    init(color: String, opacity: Float) {
        self.color = color
        self.opacity = opacity
    }
    
    // Custom encoding method to serialize as an array
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(color) 
        try container.encode(opacity) 
    }
}

struct FontDef: Codable {
    let name: String
    let size: Int
}

struct FontDefsContainer: Codable {
    let defs: [FontDef]
}

typealias OnInitCb = @convention(c) () -> Void
typealias OnTextChangedCb = @convention(c) (Int32, UnsafePointer<CChar>) -> Void
typealias OnComboChangedCb = @convention(c) (Int32, Int32) -> Void
typealias OnNumericValueChangedCb = @convention(c) (Int32, Float) -> Void
typealias OnBooleanValueChangedCb = @convention(c) (Int32, Bool) -> Void
typealias OnMultipleNumericValuesChangedCb = @convention(c) (Int32, UnsafeMutablePointer<Float>, Int32) -> Void
typealias OnClickCb = @convention(c) (Int32) -> Void

@_extern(c, "init")
func initXFrames(assetsBasePath: UnsafePointer<CChar>,
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
    let theme2Colors: [String: String] = [
        "darkestGrey": "#141f2c",
        "darkerGrey": "#2a2e39",
        "darkGrey": "#363b4a",
        "lightGrey": "#5a5a5a",
        "lighterGrey": "#7A818C",
        "evenLighterGrey": "#8491a3",
        "black": "#0A0B0D",
        "green": "#75f986",
        "red": "#ff0062",
        "white": "#fff"
    ]

    let theme: [String: [String: HEXA]] = [
        "colors": [
            "\(ImGuiCol.text.rawValue)": HEXA(color: theme2Colors["white"]!, opacity: 1.0),
            "\(ImGuiCol.textDisabled.rawValue)": HEXA(color: theme2Colors["lighterGrey"]!, opacity: 1.0),
            "\(ImGuiCol.windowBg.rawValue)": HEXA(color: theme2Colors["black"]!, opacity: 1.0),
            "\(ImGuiCol.childBg.rawValue)": HEXA(color: theme2Colors["black"]!, opacity: 1.0),
            "\(ImGuiCol.popupBg.rawValue)": HEXA(color: theme2Colors["white"]!, opacity: 1.0),
            "\(ImGuiCol.border.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.borderShadow.rawValue)": HEXA(color: theme2Colors["darkestGrey"]!, opacity: 1.0),
            "\(ImGuiCol.frameBg.rawValue)": HEXA(color: theme2Colors["black"]!, opacity: 1.0),
            "\(ImGuiCol.frameBgHovered.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.frameBgActive.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.titleBg.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.titleBgActive.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.titleBgCollapsed.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.menuBarBg.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.scrollbarBg.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.scrollbarGrab.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.scrollbarGrabHovered.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.scrollbarGrabActive.rawValue)": HEXA(color: theme2Colors["darkestGrey"]!, opacity: 1.0),
            "\(ImGuiCol.checkMark.rawValue)": HEXA(color: theme2Colors["darkestGrey"]!, opacity: 1.0),
            "\(ImGuiCol.sliderGrab.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.sliderGrabActive.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.button.rawValue)": HEXA(color: theme2Colors["black"]!, opacity: 1.0),
            "\(ImGuiCol.buttonHovered.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.buttonActive.rawValue)": HEXA(color: theme2Colors["black"]!, opacity: 1.0),
            "\(ImGuiCol.header.rawValue)": HEXA(color: theme2Colors["black"]!, opacity: 1.0),
            "\(ImGuiCol.headerHovered.rawValue)": HEXA(color: theme2Colors["black"]!, opacity: 1.0),
            "\(ImGuiCol.headerActive.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.separator.rawValue)": HEXA(color: theme2Colors["darkestGrey"]!, opacity: 1.0),
            "\(ImGuiCol.separatorHovered.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.separatorActive.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.resizeGrip.rawValue)": HEXA(color: theme2Colors["black"]!, opacity: 1.0),
            "\(ImGuiCol.resizeGripHovered.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.resizeGripActive.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.tab.rawValue)": HEXA(color: theme2Colors["black"]!, opacity: 1.0),
            "\(ImGuiCol.tabHovered.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.tabActive.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.tabUnfocused.rawValue)": HEXA(color: theme2Colors["black"]!, opacity: 1.0),
            "\(ImGuiCol.tabUnfocusedActive.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.plotLines.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.plotLinesHovered.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.plotHistogram.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.plotHistogramHovered.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.tableHeaderBg.rawValue)": HEXA(color: theme2Colors["black"]!, opacity: 1.0),
            "\(ImGuiCol.tableBorderStrong.rawValue)": HEXA(color: theme2Colors["lightGrey"]!, opacity: 1.0),
            "\(ImGuiCol.tableBorderLight.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.tableRowBg.rawValue)": HEXA(color: theme2Colors["darkGrey"]!, opacity: 1.0),
            "\(ImGuiCol.tableRowBgAlt.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.textSelectedBg.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.dragDropTarget.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.navHighlight.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.navWindowingHighlight.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.navWindowingDimBg.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0),
            "\(ImGuiCol.modalWindowDimBg.rawValue)": HEXA(color: theme2Colors["darkerGrey"]!, opacity: 1.0)
        ]
    ]

    let fontDefsContainer = FontDefsContainer(
        defs: [
            (name: "roboto-regular", sizes: [16, 18, 20, 24, 28, 32, 36, 48])
        ].flatMap { (name, sizes) in
            sizes.map { size in FontDef(name: name, size: size) }
        }
    )

    let rawFontDefsJsonData = try! JSONEncoder().encode(fontDefsContainer)
    let rawFontDefsJson = String(data: rawFontDefsJsonData, encoding: .utf8)!
    // print("JSON Output:\n\(rawFontDefsJson)")

    let themeJsonData = try! JSONEncoder().encode(theme)
    let themeJson = String(data: themeJsonData, encoding: .utf8)!
    // print("JSON Output:\n\(themeJson)")

    let assetsBasePath = "./assets".cString(using: .utf8)!
    let rawFontDefsCString = rawFontDefsJson.cString(using: .utf8)!
    let themeCString = themeJson.cString(using: .utf8)!

    initXFrames(
        assetsBasePath: assetsBasePath,
        rawFontDefinitions: rawFontDefsCString,
        rawStyleOverrideDefinitions:themeCString,
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
