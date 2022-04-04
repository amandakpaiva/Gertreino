
import Foundation

class TaskViewModel : Identifiable , ObservableObject {
    
    @Published var tasks : [Task] = [
        Task(name: "ABDOMINAL", taskName: "O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias um espécime de livro.", date: Date(timeIntervalSinceReferenceDate:1619231231.0), priority: .normal),
        Task(name: "MEMBROS INFERIORES", taskName: "lorem ipsum ", date: Date(timeIntervalSinceReferenceDate:1621231231.0), priority: .high),
        Task(name: "MEMBROS SUPERIORES", taskName: "O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias um espécime de livro.", date: Date(), priority: .medium),
        Task(name: "AEROBICO", taskName: "O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias um espécime de livro.", date: Date(), priority: .normal)
    ]
    
    @Published var sortType : SortType = .alphabetical
    @Published var isPresented = false
    @Published var searched = ""
    
    func addTask(task : Task){
        tasks.append(task)
    }
    
    func removeTask(indexAt : IndexSet){
        tasks.remove(atOffsets: indexAt)
    }
    
    func sort(){
        
        switch sortType {
        case .alphabetical :
            tasks.sort(by: { $0.name < $1.name })
        case .date :
            tasks.sort(by: { $0.date > $1.date })
        case .priority :
            tasks.sort(by: { $0.priority.rawValue > $1.priority.rawValue })
        }
    }
    
}

