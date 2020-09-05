// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mobileCatalog = try? newJSONDecoder().decode(MobileCatalog.self, from: jsonData)

import Foundation



typealias MobileCatalogs = [MobileCatalogElement]

// MARK: - MobileCatalogElement
class MobileCatalogElement: Codable {
    let id: Int?
    let brand: String?
    let phone: String?
    let picture: String?
    let announceDate: AnnounceDate?
    let sim: String?
    let resolution: String?
    let audioJack: String?
    let gps: String?
    let battery: String?
    let priceEur: Int?

    init(id: Int?, brand: String?, phone: String?, picture: String?, announceDate: AnnounceDate?, sim: String?, resolution: String?, audioJack: String?, gps: String?, battery: String?, priceEur: Int?) {
        self.id = id
        self.brand = brand
        self.phone = phone
        self.picture = picture
        self.announceDate = announceDate
        self.sim = sim
        self.resolution = resolution
        self.audioJack = audioJack
        self.gps = gps
        self.battery = battery
        self.priceEur = priceEur
    }
}

enum AnnounceDate: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(AnnounceDate.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for AnnounceDate"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}


extension MobileCatalogElement {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(MobileCatalogElement.self, from: data)
        self.init(id: me.id, brand: me.brand, phone: me.phone, picture: me.picture, announceDate: me.announceDate, sim: me.sim, resolution: me.resolution, audioJack: me.audioJack, gps: me.gps, battery: me.battery, priceEur: me.priceEur)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }


    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
    
    convenience init(_ jsonDic: Dictionary<String,AnyObject>) throws {
        let jsonData = try JSONSerialization.data(withJSONObject: jsonDic, options: .prettyPrinted)
        try self.init(data: jsonData)
        
    }
}

extension Array where Element == MobileCatalogs.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MobileCatalogs.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}


// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
