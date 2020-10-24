part of views;

class HomePage extends StatelessWidget {
  HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    model = Provider.of<HomeViewModel>(context);

    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        title: Text("Github Repos"),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Repository>>(
        stream: model.getRepos(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Repository>> snapshot) {
          if (snapshot.hasError) {
            return ErrPage(exception: snapshot.error);
          }

          if (snapshot.hasData) {
            final repos = (snapshot.data);

            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: repos.map(_buildRepo).toList(),
                ),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildRepo(Repository repo) {
    return Card(
      child: ExpansionTile(
          leading: Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: repo.userAvatarUrl,
              imageBuilder: (context, imageProvider) => Container(
                width: 50.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => Image.asset(MyImages.user),
              errorWidget: (context, url, error) => Image.asset(MyImages.user),
            ),
          ),
          title: Text(repo.name),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _iconsCountRow(Icons.star_border, repo.starsCount),
              _iconsCountRow(CupertinoIcons.tuningfork, repo.forksCount),
            ],
          ),
          maintainState: true,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(repo.description),
            ),
          ]),
    );
  }

  _iconsCountRow(IconData icon, int count) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 19.0),
          SizedBox(width: 5.0),
          Text(
            '$count',
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 13.0),
          ),
        ],
      ),
    );
  }
}


class GithubReposPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

