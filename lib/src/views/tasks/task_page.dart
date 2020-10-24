part of views;

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [

            Card(
              child: ListTile(
                title: Text("Task Title"),
                subtitle: Text("Task Subtitle"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
