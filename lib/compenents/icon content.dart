

class IconDescription extends StatelessWidget {

  IconDescription ({this.icon,this.description}) ;

  final String description ;
  final Icon icon ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 10,
        child: Icon(Icons.access_time),
        // no matter how big it is, it won't overflow
      ),
    );
  }
}
