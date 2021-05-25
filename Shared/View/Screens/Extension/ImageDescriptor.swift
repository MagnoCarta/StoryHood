//
//  ImageDescriptor.swift
//  StoryHood
//
//  Created by Gilberto Magno on 5/24/21.
//

import Foundation
import SwiftUI

//swiftlint:disable line_length
public enum ImageExtension: String {
    case png, jpeg, jpg, svg
}
public protocol BundleIdentifiable {
    var bundle: Bundle { get }
}

public enum GlobalImage: String, ImageDescriptor {
    case badWolf,littleRedRidingHood,offlineIcon,onlineIcon,treesBg,sendButton
}

public protocol ImageDescriptor: RawRepresentable where RawValue == String { }

public protocol ImageRetriever {
    associatedtype ImageDescriptorType: ImageDescriptor = GlobalImage
    func image<ImageType: ImageDescriptor>(_ imageName: ImageType) -> Image
    func imageUrl<ImageType: ImageDescriptor>(_ imageName: ImageType,
                                              imageExtension: ImageExtension) -> URL?

    func image(_ imageName: ImageDescriptorType) -> Image
    func imageUrl(_ imageName: ImageDescriptorType, imageExtension: ImageExtension) -> URL?
}

public extension ImageRetriever where Self: BundleIdentifiable {
    func image<ImageType: ImageDescriptor>(_ imageName: ImageType) -> Image {
        return Image(imageName.rawValue, bundle: bundle)
    }
    func imageUrl<ImageType: ImageDescriptor>(_ imageName: ImageType, imageExtension: ImageExtension) -> URL? {
        return bundle.url(forResource: imageName.rawValue, withExtension: imageExtension.rawValue)
    }
    func image(_ imageName: ImageDescriptorType) -> Image {
        return Image(imageName.rawValue, bundle: bundle)
    }
    func imageUrl(_ imageName: ImageDescriptorType, imageExtension: ImageExtension) -> URL? {
        return bundle.url(forResource: imageName.rawValue, withExtension: imageExtension.rawValue)
    }
}

public extension ImageRetriever where Self: AnyObject {
    func image<ImageType: ImageDescriptor>(_ imageName: ImageType) -> Image {
        return Image(imageName.rawValue, bundle: Bundle(for: type(of: self)))
    }
    func imageUrl<ImageType: ImageDescriptor>(_ imageName: ImageType, imageExtension: ImageExtension) -> URL? {
        return Bundle(for: type(of: self)).url(forResource: imageName.rawValue, withExtension: imageExtension.rawValue)
    }
    func image(_ imageName: ImageDescriptorType) -> Image {
        return Image(imageName.rawValue, bundle: Bundle(for: type(of: self)))
    }
    func imageUrl(_ imageName: ImageDescriptorType, imageExtension: ImageExtension) -> URL? {
        return Bundle(for: type(of: self)).url(forResource: imageName.rawValue, withExtension: imageExtension.rawValue)
    }
}

public extension ImageRetriever {
    var globalRetriver: GlobalImageRetriever {
        return GlobalImageRetriever()
    }
}

public struct GlobalImageRetriever: ImageRetriever, BundleIdentifiable {
    public var bundle: Bundle {
        return Bundle()
    }
    public init() {}
}
