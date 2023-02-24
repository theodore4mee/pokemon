import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router'
import { PokemonHttpClient } from "../../services/pokemonService"

@Component({
  selector: 'app-pokemon-details',
  templateUrl: './pokemon-details.component.html',
  styleUrls: ['./pokemon-details.component.css']
})
export class PokemonDetailsComponent implements OnInit {
  public pokemonSprite: string = "";
  public pokemonSpriteId: string = "";
  public pokemonDetails: string = "";
  public pokemonName: string = "";
  public pokemonAbility: any = "";
  public pokemonWeight: string = "";


  constructor(private router: Router, private activatedRoute: ActivatedRoute, private pokemonService: PokemonHttpClient) { }

  ngOnInit(): void {
    this.activatedRoute.params.subscribe(params => {
      this.pokemonName = params['name']; //I thing this can be improved
      this.pokemonSpriteId = params['id'];
    });

    this.pokemonService.getPokemonDetails(this.pokemonSpriteId).subscribe((result) => {
      let res = JSON.parse(result);
      this.pokemonAbility = res.abilities;
      this.pokemonWeight = res.weight;
      
      //This should be in the constant file
      this.pokemonSprite = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/" + this.pokemonSpriteId + ".png";
    });
  }

  goBack() {
    this.router.navigateByUrl("/");
  }
}
