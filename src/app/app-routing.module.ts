import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { PokemonDetailsComponent } from './pokemon-details/pokemon-details.component';
import { PokemonComponent } from './pokemon/pokemon.component';
import { PokemonHttpClient } from "../services/pokemonService"

const routes: Routes = [
  
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: PokemonComponent },
  { path: 'details/:name/:id', component: PokemonDetailsComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
  providers: [PokemonHttpClient]
})
export class AppRoutingModule { }
