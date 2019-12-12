//
//  PropertyKeys.swift
//  Astronomy
//
//  Created by Jon Bash on 2019-12-12.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct PropertyKeys {
    static let uiTesting = (
        collectionVC: (
            photoCell: "PhotoCell",
            button: (
                prevSol: (
                    label: "prevSol",
                    id: "<"
                ),
                nextSol: (
                    label: "nextSol",
                    id: ">"
                )
            )
        ),
        detailVC: (
            saveToPhotoLibraryButton: (
                text: "Save to Photo Library",
                id: "saveToPhotoLibrary"
            ),
            titleID: "",
            descriptionID: "",
            cameraLabelID: ""
        ),
        sol14: (
            title: "Sol 14",
            photo: (
                first: (
                    title: "Sol 14 - Photo 726",
                    description: "Taken by 5 on 8/19/12, 5:00 PM (Sol 14)",
                    camera: "Camera: Front Hazard Avoidance Camera"
                ),
                last: (
                    title: "Sol 14 - Photo 49158",
                    description: "Taken by 5 on 8/19/12, 5:00 PM (Sol 14)",
                    camera: "Camera: Navigation Camera"
                )
            )
        )
    )
}

