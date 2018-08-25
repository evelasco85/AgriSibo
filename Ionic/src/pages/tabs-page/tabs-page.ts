import { Component } from '@angular/core';

import { NavParams } from 'ionic-angular';

import { HomePage } from '../home/home';
// import { HomePage } from '../home/home';
// import { HomePage } from '../home/home';
// import { HomePage } from '../home/home';

@Component({
  templateUrl: 'tabs-page.html'
})
export class TabsPage {
  // set the root pages for each tab
  tab1Root: any = HomePage;
  tab2Root: any = HomePage;
  tab3Root: any = HomePage;
  mySelectedIndex: number;

  constructor(navParams: NavParams) {
    this.mySelectedIndex = navParams.data.tabIndex || 0;
  }

}
