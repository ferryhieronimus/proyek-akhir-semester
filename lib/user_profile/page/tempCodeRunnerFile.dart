
                        child: Image.asset("assets/images/logo.png", width: 3, height: 3),
                        ),
                    onTap: () {
                        if (scaffoldKey.currentState!.isDrawerOpen) {
                            scaffoldKey.currentState!.closeDrawer();
                            //close drawer, if drawer is open
                        } else {
                            scaffoldKey.currentState!.openDrawer();
                            //open drawer, if drawer is closed
                        }
                    }