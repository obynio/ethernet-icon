import SwiftUI
import LaunchAtLogin

/// View that handles application settings
struct SettingsView: View {
    // Persisted storage for the selected icon style
    @AppStorage("selectedOption") var selectedOption: String = "Select an Option"
    
    var body: some View {
        VStack(alignment: .leading) {
            // Toggle for launching app at login
            LaunchAtLogin.Toggle()
                .padding(.bottom, 10)
            
            // Icon style selector
            HStack {
                Text("Icon Style:")
                    .padding(.trailing, 5)
                
                // Dropdown menu for icon style selection
                Menu {
                    Button(action: { updateIcon(selectedOption: "Windows") }) {
                        Text("Windows")
                    }
                    Button(action: { updateIcon(selectedOption: "macOS") }) {
                        Text("macOS")
                    }
                } label: {
                    Text(selectedOption)
                        .foregroundColor(.primary)
                        .padding()
                        .background(Color(NSColor.windowBackgroundColor))
                        .cornerRadius(5)
                        .border(Color.gray.opacity(0.5), width: 1)
                        .frame(maxWidth: 200, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(width: 300, height: 80)
        .navigationTitle("Settings")
    }
    
    /// Updates the icon style and triggers a refresh of the status bar icon
    func updateIcon(selectedOption: String) {
        self.selectedOption = selectedOption
        AppDelegate.instance.updateStatusIcon()
    }
}

// Preview provider for SwiftUI
#Preview {
    SettingsView()
}
