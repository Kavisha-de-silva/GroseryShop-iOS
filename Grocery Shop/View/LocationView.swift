//
//  LocationView.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-22.
//6.932352057198281, 79.87117364221162
//

import SwiftUI
import MapKit

struct LocationView: View {
    //let cameraPosition: MapCameraPosition = .region(.init(center: .init(latitude: 37.3346, longitude: -122.0090),
        //latitudinalMeters: 1300,longitudinalMeters: 1300)) //map zoom in and out
    let cameraPosition: MapCameraPosition = .region(.init(center: .init(latitude: 6.850217, longitude: 79.981285),
        latitudinalMeters: 1300,longitudinalMeters: 1300)) //map zoom in and out
    
    let locationManager = CLLocationManager()
    
    @State private var lookAroundScene: MKLookAroundScene?
    @State private var isShowingLookAround = false
    @State private var route: MKRoute?
    
    var body: some View {
        Map(initialPosition: cameraPosition) {
            //Marker("Centrum Mart Pvt Ltd", systemImage: "cart", coordinate: .CentrumMart)
            //Marker("Ayesha Super Center", systemImage: "cart", coordinate: .AyeshaSuper)
            Annotation("Centrum Mart Pvt Ltd", coordinate: .CentrumMart,anchor: .bottom) {
                Image(systemName: "cart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 20,height: 20)
                    .padding(7)
                    .background(.blue .gradient,in: .circle)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 4)
                            )
                    .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2) // subtle shadow
                    .contextMenu{
                        Button("Open Look Around", systemImage: "binoculars") {
                            Task{
                                lookAroundScene = await getLookAroundScene(from: .CentrumMart)
                                guard lookAroundScene != nil else { return }
                                isShowingLookAround = true
                            }
                        }
                        Button("Get Directions", systemImage: "arrow.turn.down.right") {
                            getDirections(to: .CentrumMart)
                        }
                    }
            }
            
            Annotation("Ayesha Super", coordinate: .AyeshaSuper,anchor: .bottom) {
                Image(systemName: "cart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 20,height: 20)
                    .padding(7)
                    .background(.blue .gradient,in: .circle)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 4)
                            )
                    .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2) // subtle shadow
                    .contextMenu{
                        Button("Open Look Around", systemImage: "binoculars") {
                            Task{
                                lookAroundScene = await getLookAroundScene(from: .AyeshaSuper)
                                guard lookAroundScene != nil else { return }
                                isShowingLookAround = true
                            }
                        }
                        Button("Get Directions", systemImage: "arrow.turn.down.right") {
                            getDirections(to: .AyeshaSuper)
                        }
                    }
            }
            
            UserAnnotation()
            
            if let route {
                MapPolyline(route)
                    .stroke(Color.pink, lineWidth: 4)
            }
            
        }
        .tint(.red)
        .onAppear{
            locationManager.requestWhenInUseAuthorization()
        }
        .mapControls{
            MapUserLocationButton()
            MapCompass()
            MapPitchToggle()
            MapScaleView()
        }
        .mapStyle(.standard(elevation: .realistic))
        .lookAroundViewer(isPresented: $isShowingLookAround, initialScene: lookAroundScene)
    }
    
    func getLookAroundScene(from coordinate: CLLocationCoordinate2D) async -> MKLookAroundScene? {
        do{
            return try await MKLookAroundSceneRequest(coordinate: coordinate).scene
        } catch {
            print("Cannot Retrieve Look Around scene: \(error.localizedDescription)")
            return nil
        }
    }
    func getUserLocation() async -> CLLocationCoordinate2D? {
        let updates = CLLocationUpdate.liveUpdates()
        
        do{
            let update = try await updates.first { $0.location?.coordinate != nil }
            return update?.location?.coordinate
        } catch {
            print("Cannot get User Location")
            return nil
        }
    }
    
    func getDirections(to destination: CLLocationCoordinate2D) {
        Task {
            guard let userLocation = await getUserLocation() else { return }
            
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: userLocation))
            request.destination = MKMapItem(placemark: .init(coordinate: destination))
            request.transportType = .walking
            
            do {
                let directions = try await MKDirections(request: request).calculate()
                route = directions.routes.first
            } catch {
                print("Show error")
            }
        }
    }
}

#Preview {
    LocationView()
}
/*
extension CLLocationCoordinate2D{
    static let Centrum = CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0090)
    static let CentrumMart = CLLocationCoordinate2D(latitude: 37.332753, longitude: -122.005372)
    static let AyeshaSuper = CLLocationCoordinate2D(latitude: 37.347730, longitude: -122.018715)
    //6.928720471195519, 79.8711068292695
}*/

extension CLLocationCoordinate2D{
    static let Centrum = CLLocationCoordinate2D(latitude: 6.850217, longitude: 79.981285)
    static let CentrumMart = CLLocationCoordinate2D(latitude: 6.851548, longitude: 79.980390)
    static let AyeshaSuper = CLLocationCoordinate2D(latitude: 6.849263, longitude: 79.976805)
    //6.928720471195519, 79.8711068292695
}
//6.851547597211621, 79.98039048414357

