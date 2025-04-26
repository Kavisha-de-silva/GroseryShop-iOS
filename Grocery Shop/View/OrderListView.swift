import SwiftUI
import UniformTypeIdentifiers

struct OrderListView: View {
    @State private var showDocumentPicker = false
    @State private var selectedOption: OrderType? = nil
    @State private var showAlert = false
    @State private var selectedDocument: URL?
    @State private var documentName: String?
    @State private var showFileInfo = false
    @State private var navigateToLocationView = false
    @Environment(\.dismiss) var dismiss
    
    enum OrderType: String, CaseIterable {
        case cod = "COD Order"
        case storePickup = "Store Pickup Order"
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Add Your Order List")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.top)
                        
                        Text("You can attach your own list of items. This is only allowed for COD orders and store pickup orders.")
                            .font(.body)
                            .foregroundColor(.secondary)
                        
                        Text("Note: This is only allowed for COD orders and store pickup orders.")
                            .font(.subheadline)
                            .foregroundColor(.red)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Select Order Type:")
                                .font(.headline)
                            
                            ForEach(OrderType.allCases, id: \.self) { option in
                                HStack {
                                    Image(systemName: selectedOption == option ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(selectedOption == option ? .green : .gray)
                                    Text(option.rawValue)
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedOption = option
                                    showAlert = true
                                }
                            }
                        }
                        .padding(.vertical)
                        
                        if selectedOption == .storePickup {
                            Button(action: {
                                navigateToLocationView = true
                            }) {
                                HStack {
                                    Image(systemName: "mappin.and.ellipse")
                                    Text("View Nearest Shop")
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                        }
                        
                        if showFileInfo, let name = documentName {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Attached File:")
                                    .font(.headline)
                                HStack {
                                    Image(systemName: "doc.fill")
                                        .foregroundColor(.blue)
                                    Text(name)
                                        .lineLimit(1)
                                    Spacer()
                                    Button(action: {
                                        selectedDocument = nil
                                        documentName = nil
                                        showFileInfo = false
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.red)
                                    }
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                            }
                        }
                        
                        Spacer()
                            .frame(height: 80)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 80)
                }
                
                Button(action: {
                    showDocumentPicker = true
                }) {
                    HStack {
                        Image(systemName: documentName == nil ? "paperclip" : "doc.fill")
                        Text(documentName == nil ? "Attach The List" : "Change Attached File")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedOption != nil ? Color.green : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .disabled(selectedOption == nil)
                .padding(.horizontal)
                .padding(.bottom, 20)
                .shadow(radius: 5)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Order Type Selected"),
                    message: Text("You selected \(selectedOption?.rawValue ?? "")."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .sheet(isPresented: $showDocumentPicker) {
                DocumentPickerView(selectedDocument: $selectedDocument, documentName: $documentName) {
                    showFileInfo = true
                }
            }
            .navigationDestination(isPresented: $navigateToLocationView) {
                LocationView()
            }
            .navigationTitle("Order List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        dismiss()
                    }
                    .font(.headline)
                    .foregroundColor(.blue)
                }
            }
        }
    }
}

struct DocumentPickerView: UIViewControllerRepresentable {
    @Binding var selectedDocument: URL?
    @Binding var documentName: String?
    var onDismiss: () -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [.text, .pdf, .image, .item], asCopy: true)
        picker.allowsMultipleSelection = false
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: DocumentPickerView
        
        init(_ parent: DocumentPickerView) {
            self.parent = parent
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let url = urls.first else { return }
            
            guard url.startAccessingSecurityScopedResource() else {
                return
            }
            
            defer { url.stopAccessingSecurityScopedResource() }
            
            parent.selectedDocument = url
            parent.documentName = url.lastPathComponent
            parent.onDismiss()
        }
        
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            }
    }
}

#Preview {
    OrderListView()
}
