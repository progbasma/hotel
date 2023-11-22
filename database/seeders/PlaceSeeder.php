<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Hotel\Models\Place;
use Botble\Slug\Facades\SlugHelper;
use Botble\Slug\Models\Slug;
use Illuminate\Support\Str;

class PlaceSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->uploadFiles('places');

        Place::query()->truncate();

        $places = [
            [
                'name' => 'Duplex Restaurant',
                'distance' => '1,500m | 21 min. Walk',
                'content' => $this->fake()->realText(1000),
                'image' => 'places/01.jpg',
            ],
            [
                'name' => 'Duplex Restaurant',
                'distance' => '1,500m | 21 min. Walk',
                'content' => $this->fake()->realText(1000),
                'image' => 'places/02.jpg',
            ],
            [
                'name' => 'Duplex Restaurant',
                'distance' => '1,500m | 21 min. Walk',
                'content' => $this->fake()->realText(1000),
                'image' => 'places/03.jpg',
            ],
            [
                'name' => 'Duplex Restaurant',
                'distance' => '1,500m | 21 min. Walk',
                'content' => $this->fake()->realText(1000),
                'image' => 'places/04.jpg',
            ],
            [
                'name' => 'Duplex Restaurant',
                'distance' => '1,500m | 21 min. Walk',
                'content' => $this->fake()->realText(1000),
                'image' => 'places/05.jpg',
            ],
            [
                'name' => 'Duplex Restaurant',
                'distance' => '1,500m | 21 min. Walk',
                'content' => $this->fake()->realText(1000),
                'image' => 'places/06.jpg',
            ],
        ];

        foreach ($places as $place) {
            $place = Place::query()->create($place);

            Slug::query()->create([
                'reference_type' => Place::class,
                'reference_id' => $place->id,
                'key' => Str::slug($place->name),
                'prefix' => SlugHelper::getPrefix(Place::class),
            ]);
        }
    }
}
