//
//  PlacesModel.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 09/11/24.
//
import SwiftUI
import GooglePlaces

class PlacesModel: ObservableObject {
    @Published var searchItem: String = "Search here.."
    @Published var resortName: String = "Search Resort"
    
    @Published var resortLatitude: Double = 0.0
    @Published var resortLongitude: Double = 0.0
    
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    
    @Published var isPresentingAutocomplete: Bool = false
    @Published var filterType: PlaceFilterType = .city

    func handleAutocompleteResponse(place: GMSPlace) {
            self.searchItem = place.name ?? ""
            self.latitude = place.coordinate.latitude
            self.longitude = place.coordinate.longitude
    }
    
    func dismissAutocomplete() {
        isPresentingAutocomplete = false
    }
    
    func showAutocomplete() {
        isPresentingAutocomplete = true
    }
    
}


struct GooglePlacesAutocompleteView: UIViewControllerRepresentable {
    @ObservedObject var viewModel: PlacesModel

    func makeUIViewController(context: Context) -> GMSAutocompleteViewController {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = context.coordinator

        let filter = GMSAutocompleteFilter()
        switch viewModel.filterType {
        case .city:
            filter.type = .city
        case .noFilter:
            break
        }
        autocompleteController.autocompleteFilter = filter

        return autocompleteController
    }

    func updateUIViewController(_ uiViewController: GMSAutocompleteViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self, viewModel: viewModel)
    }

    class Coordinator: NSObject, GMSAutocompleteViewControllerDelegate {
        var parent: GooglePlacesAutocompleteView
        var viewModel: PlacesModel

        init(_ parent: GooglePlacesAutocompleteView, viewModel: PlacesModel) {
            self.parent = parent
            self.viewModel = viewModel
        }

        func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
            viewModel.handleAutocompleteResponse(place: place)
            viewModel.dismissAutocomplete()
        }

        func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
            print("Autocomplete error: \(error.localizedDescription)")
            viewModel.dismissAutocomplete()
        }

        func wasCancelled(_ viewController: GMSAutocompleteViewController) {
            viewModel.dismissAutocomplete()
        }
    }
    
}

enum PlaceFilterType {
    case city
    case noFilter
}
