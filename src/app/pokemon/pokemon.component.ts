import { Component, OnInit } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { PokemonHttpClient } from "../../services/pokemonService"
import { IPokemon } from "../../abstractions/IPokemon";
import { IPokemonClient } from "../../abstractions/IPokemonClient";

@Component({
  selector: 'app-pokemon',
  templateUrl: './pokemon.component.html',
  styleUrls: ['./pokemon.component.css']
})
export class PokemonComponent implements OnInit {

  //this is for incase http request fails, the page shouldnt be broken since we dont have error handling
  public pokemon: any = [
    { id: 1, name: 'Bulbasaur' },
    { id: 13, name: 'Bombasto' },
    { id: 14, name: 'Celeritas' },
    { id: 15, name: 'Magneta' },
    { id: 16, name: 'RubberMan' },
    { id: 17, name: 'Dynama' },
    { id: 18, name: 'Dr. IQ' },
    { id: 19, name: 'Magma' },
    { id: 20, name: 'Tornado' }
  ];

  constructor(private pokemonService: PokemonHttpClient) { }

  ngOnInit(): void {
    this.pokemonService.getPokemons().subscribe((result: any) => {
      this.pokemon = result.data.results;
    });
  }
}
