import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var taskVM : TaskViewModel
    
    @State var name = ""
    @State var taskName = ""
    @State var date = Date()
    @State var priority : Priority = .normal
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Treino")) {
                    TextField("Nome do treino ", text : $name)
                    TextField("Descrição", text : $taskName)
                }
                Section {
                    Picker("Nível de dificuldade", selection: $priority) {
                        ForEach(Priority.allCases) { priority in
                            Label(
                                title: { Text(priority.title) },
                                icon: { Image(systemName: "exclamationmark.circle") })
                                .foregroundColor(priority.color)
                                .tag(priority)
                        }
                    }
                }
                
                DisclosureGroup("Data do treino") {
                    DatePicker("", selection: $date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                
            }
            .navigationBarTitle("Adicone seu treino", displayMode: .inline)
            .navigationBarItems(
                                leading: Button(action:{
                                                presentationMode.wrappedValue.dismiss() },
                                                label : {
                                                    Text("Cancelar")
                                                    .foregroundColor(.red)
                                                }),
                                trailing: Button(action:{taskVM.addTask(task: .init(name: name, taskName: taskName, date: date, priority: priority))
                                                    presentationMode.wrappedValue.dismiss()},
                                                   label:{
                                                    Text("Salvar")
                                                   }).disabled(name.isEmpty || taskName.isEmpty)
            )
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskVM: TaskViewModel())
    }
}
